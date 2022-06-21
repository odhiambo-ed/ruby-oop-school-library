require './classroom'
require './rental'
require './student'
require './teacher'
require './book'

class App
  attr_reader :books, :rental, :people

  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def all_book
    @books&.each do |book|
      puts "[#{book.class}] - Title: #{book.title}, Author: #{book.author}"
    end
  end

  def all_person
    @people&.each do |person|
      puts "[#{person.class}] - Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def all_rental(id)
    @people.each do |person|
      next unless person.id == id

      person.rental.each do |rental|
        puts "[#{rental.class}] - Book: #{rental.book.title}, Person: #{rental.person.name}, Date: #{rental.date}"
      end
    end
  end

  def create_book(title:, author:)
    @books << Book.new(title: title, author: author)
  end

  def create_student(age:, name:, parent_permission: true, classroom: nil)
    @people << Student.new(age: age, name: name, parent_permission: parent_permission, classroom: classroom)
  end

  def create_teacher(specialization:, age:, name:, parent_permission: true)
    @people << Teacher.new(specialization: specialization, age: age, name: name, parent_permission: parent_permission)
  end

  def create_rental(book:, person:, date:)
    @rental << Rental.new(book: book, person: person, date: date)
  end
end

app = App.new
app.all_book