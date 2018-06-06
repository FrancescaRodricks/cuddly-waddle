class Book
  def author
    puts 'Enid Blyton'
  end

  def title
    puts 'Famous Five'
  end

  def self.deprecate(old_method, new_method)
    define_method(old_method) do |*args, &block|
      # warn this prints in the console. Isnt this something new i learnt today? :)
      warn "warning old method #{old_method} is deprecated use #{new_method}"

      send(new_method, *args, &block)
    end
  end

  deprecate :OldTitle, :title
  deprecate :Author, :author
end


# how to deprecate old methods and delegate the request to new methods
Book.new.OldTitle
Book.new.Author