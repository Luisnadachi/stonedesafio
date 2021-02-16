class Person

    attr_accessor :email, :validation_email, :validation_item, :item, :amount, :value

    def register

        email_array = Array.new
        items_array = Array.new
        persons = Array.new
        total = 0

        puts("------Cadastro de emails------")

        loop do
            puts ("Digite seu email:")
            email = gets.chomp.to_s
            email_array.push(email)
            puts("Deseja continuar cadastrando email? 1-Sim ou 0-Não")
            validation_email = gets.chomp
            if (validation_email == "0")
                break
            end
        end

        puts("Os emails cadastrados foram: #{email_array}")

        puts("------Cadastro de Itens------")

        loop do
            puts ("Digite o nome do item:")
            item = gets.chomp.to_s
            puts ("Digite a quantidade do item:")
            amount = gets.chomp.to_i
            puts ("Digite o valor do item:")
            value = gets.chomp.to_i

            items_array.push({
                'item' => item,
                'amount' => amount,
                'value' => value
            })

            puts ("Deseja cadastra mais itens? 1-Sim ou 0-Não")
            validation_item = gets.chomp

            if (validation_item == "0")
                break
            end
        end

        system "clear"

        items_array.each do |item|
            total += (item['amount'] * item['value'])  
        end

        valuePerson = total / email_array.size
        totalRemaining = total - (valuePerson * email_array.size)

        email_array.each_with_index do |email, i|
            persons.push({
                'email' => email,
                'valuePerson' => valuePerson
            })
        
            if (totalRemaining > 0)
                persons[i]['valuePerson'] += 1
                totalRemaining -= 1
            end
        end   
        
        persons.each do |persons|
            puts "#{persons['email']} irá pagar #{persons['valuePerson']}"
        end


    end
end