# GL Farias Estética Automotiva

Site estático em HTML5, CSS3, JavaScript Vanilla, GSAP 3 e ScrollTrigger. Nenhum framework ou instalação é necessário para abrir `index.html`. Para prévia por HTTP, use um servidor estático apontado para esta pasta.

## Auditoria inicial e arquitetura

A pasta estava vazia: nenhum arquivo, logo, fotografia, interface, interação ou comportamento mobile existente. Nada foi removido ou substituído. A identidade temporária usa exclusivamente os tons neutros do briefing; não foi inventada cor de marca. As superfícies abstratas são placeholders identificados, nunca resultados reais.

Jornada: header → hero → autoridade → identificação → transformação → serviços → qualidade → processo → atendimento → resultados → depoimentos → momento emocional → qualificação → CTA → FAQ → localização → footer.

## Edição

- `js/content.js`: textos, avaliações fornecidas, contato, horários, imagens, serviços e configurações.
- `css/style.css`: identidade, layout, responsividade e reduced motion.
- `js/animations.js`: funções por seção; pin apenas desktop e sem preferência de movimento reduzido.
- `js/main.js`: renderização, menu, dialog, FAQ, comparador acessível, eventos e formulário.
- `assets/images/README.md`: instruções de substituição das fotografias.

O catálogo não foi confirmado pelo negócio. Os blocos iniciais são consultas de interesse, com linguagem condicional. Não foram adicionados PPF, vitrificação, lavagem de motor ou serviços técnicos não confirmados. As oito avaliações são as fornecidas no briefing. `ratingVerified` permanece falso e evita AggregateRating sem revalidação.

## WhatsApp e registro opcional

O formulário valida seis campos, prepara uma mensagem com `encodeURIComponent` e abre o WhatsApp durante o gesto de envio. O registro opcional começa antes da abertura, mas nunca é aguardado para permitir o contato. Um link explícito permanece disponível caso popups sejam bloqueados. A mensagem só é enviada quando o visitante confirma no WhatsApp.

Não se pode garantir entrega caso o visitante feche a página ou esteja sem conexão. Nenhum dado pessoal é gravado no localStorage. O formulário preserva os campos na página após envio. A classificação QUENTE/MORNO/PESQUISA nunca é mostrada ao visitante.

Para Supabase: aplicar `supabase/schema.sql`, preencher URL e chave pública em `config.supabase` e ativar `enabled`. Nunca usar service_role no navegador. A tabela permite apenas inserção pública; leitura e alterações dependem de acesso administrativo. Em produção, adicionar proteção contra abuso em endpoint próprio se necessário.

## Analytics

`analyticsEnabled` inicia falso. A camada emite `gl:analytics` e, quando habilitada, eventos em `dataLayer`, sem nome, telefone, veículo ou texto pessoal. Eventos: hero_cta_click, service_click, before_after_interaction, testimonial_view, qualification_started, qualification_step, qualification_abandoned, qualification_completed, whatsapp_direct_click, whatsapp_qualified_click, map_click, instagram_click, faq_open, lead_storage_unavailable. A origem da seção acompanha o funil. Instale o coletor real somente após definir a configuração de privacidade do negócio; não há IDs fictícios.

## Publicação e SEO

Execute `node scripts/build.cjs` para gerar a publicação com o endereço de `config.siteUrl`. É possível passar o domínio HTTPS real como argumento. A pasta `dist` recebe somente os arquivos públicos, canonical, Open Graph, imagem de compartilhamento e sitemap válido. Para pré-renderizar conteúdo e schema, mantenha `node scripts/serve.cjs` ativo e execute `node scripts/prerender.cjs` com Playwright disponível. A alternativa PowerShell em `scripts/build.ps1` faz apenas a cópia estática básica.

Title/description/Open Graph são definidos em `content.js` e incorporados ao HTML pelo build. A publicação inclui conteúdo principal e LocalBusiness pré-renderizados. O mapa usa pesquisa por endereço completo e abre externamente; iframe só aparece quando uma URL correta for configurada. GSAP e fontes usam CDNs, com fallback funcional se indisponíveis.

## Pendências de conteúdo real

Logo, fotografias, confirmação do catálogo, revalidação da nota/horários, domínio oficial e credenciais opcionais. Textos de privacidade e termos descrevem o funcionamento atual e devem ser revisados pelo responsável quando integrações forem ativadas.
