Facter.add("env") do
    setcode do
        if Facter.value('hostname')
            Facter.value('hostname').split('-')[0]
        end
    end
end
Facter.add("role") do
    setcode do
        if Facter.value('hostname')
            Facter.value('hostname').split('-')[1]
        end
    end
end
Facter.add("hostid") do
    setcode do
        if Facter.value('hostname')
            Facter.value('hostname').split('-')[2]
        end
    end
end

