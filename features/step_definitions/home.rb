Quando("eu adicionar {int} tarefa valida") do |int|
  @tarefas = Hash.new
  for i in 1..int do
    tarefa = MASS['TASK_LIST']['task_valida']['nome'].dup.gsub('{id}', i.to_s)
    @tarefas[tarefa] = false
    fill_in('Nova tarefa...', with: tarefa)
    find('#add').click
  end
end

Entao("as tarefas retornadas devem ser exibidas corretamente") do
  @tarefas.each do |key, value|
    expect(find('#tasks')).to have_content(key)
  end
end

Quando("eu adicionar {int} tarefa inválida") do |int|
  tarefa = MASS['TASK_LIST']['task_invalida']['nome'].dup
  for i in 1..int do
    fill_in('Nova tarefa...', with: tarefa)
    find('#add').click
  end
end

Entao("não será adicionado nenhuma tarefa") do
  expect(page).not_to have_css('#tasks > div > p.is-expanded')
end

Entao("a quantidade de tarefas deve ser igual a {int}") do |int|
  page.all('#tasks > div > p.is-expanded').size.should be == int
end

Quando("eu remover {int} tarefa") do |int|
  i = 1
  page.all('#tasks > div').each do |e|
    @tarefas.delete(e.find('p.is-expanded').text)
    e.find('#remove').click
    break if i >= int
    i += 1
  end
end

Quando("eu marcar {int} tarefas como concluidas") do |int|
  i = 1
  page.all('#tasks > div').each do |e|
    e.find('#close-open').click
    @tarefas[e.find('p.is-expanded').text] = true
    break if i >= int
    i += 1
  end
end

Entao("as tarefas marcadas como concluidas devem estar corretas") do
  page.all('#tasks > div').each do |e|
    expect(e).to have_css('.checked') if @tarefas[e.find('p.is-expanded').text] == true
  end
end