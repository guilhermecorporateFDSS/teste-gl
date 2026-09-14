-- Integração opcional. Execute no projeto Supabase escolhido pelo responsável.
create table if not exists public.leads (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  name text not null check (char_length(name) between 1 and 100),
  phone text not null check (char_length(phone) between 10 and 13),
  vehicle text not null check (char_length(vehicle) between 1 and 100),
  service_interest text not null,
  vehicle_condition text not null,
  urgency text not null,
  source text not null,
  status text not null default 'novo' check (status in ('novo','em_contato','negociando','agendado','fechado','perdido')),
  priority text not null check (priority in ('QUENTE','MORNO','PESQUISA'))
);
alter table public.leads enable row level security;
revoke all on public.leads from anon;
grant insert on public.leads to anon;
create policy "site may submit new leads" on public.leads for insert to anon
with check (status = 'novo');
-- Sem políticas de SELECT/UPDATE/DELETE para visitantes.
-- Use somente a chave pública anon/publishable no site. Nunca service_role.
-- Para produção com proteção contra abuso, prefira endpoint com rate limit.
