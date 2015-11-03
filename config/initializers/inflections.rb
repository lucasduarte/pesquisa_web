# encoding: utf-8
# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'Produto', 'produtos'
  inflect.irregular 'categoria', 'categorias'
  inflect.irregular 'alerta', 'alertas'
  inflect.irregular 'pesquisa', 'pesquisas'
  inflect.irregular 'usuario', 'usuarios'
end
