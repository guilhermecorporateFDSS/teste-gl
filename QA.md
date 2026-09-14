# Verificação da implementação

Testes automatizados executados no Microsoft Edge local, sem enviar mensagens à empresa.

- Larguras 320, 360, 375, 390, 430, 768, 1024 e 1440 px: sem overflow horizontal.
- Oito avaliações renderizadas e um único h1.
- Formulário válido: mensagem com dados e encodeURIComponent, destino correto e link alternativo presente.
- Falha simulada do Supabase: mensagem continua disponível e abertura do WhatsApp é solicitada.
- Aberturas externas foram interceptadas no teste; nenhuma mensagem ou lead de teste foi enviado.
- Comparador pelo teclado; FAQ abre com estado ARIA atualizado.
- Menu mobile abre, fecha após seleção e libera a rolagem.
- Reduced motion sem elementos pinados.
- Todas as âncoras locais encontram seus destinos.
- Falha simulada de CDN: conteúdo e formulário seguem disponíveis.
- Nenhum dado pessoal escrito no localStorage e nenhum erro JavaScript observado.
- Inspeção visual de capturas em 1440 e 390 px.

Ainda exige verificação em aparelho físico: gesto de arraste touch, abertura no aplicativo WhatsApp, rotação real e desempenho de 60 fps. Integração real com Supabase depende da configuração do negócio. Não foi feita medição Lighthouse.

Foi preparada uma ação WebMCP opcional que apenas abre a qualificação e seleciona o interesse. Nenhum contexto WebMCP nativo está disponível neste ambiente para certificar o registro; navegadores sem a API mantêm a interface normal.
