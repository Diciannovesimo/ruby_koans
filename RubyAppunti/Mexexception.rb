class TypicalObject
  

  def test_sending_undefined_messages_to_a_typical_object_results_in_errors
    typical = TypicalObject.new

   
      typical.foobar
   
    puts exception.message
  end

  def test_calling_method_missing_causes_the_no_method_error
    typical = TypicalObject.new

    exception = assert_raise(NoMethodError) do
      typical.method_missing(:foobar)
    end
    puts exception.message
  end
end

class AboutMethods

  
  def test_calling_global_methods_with_wrong_number_of_arguments
    exception = assert_raise(ArgumentError) do
      my_global_method
    end
   puts exception.message

    exception = assert_raise(ArgumentError) do
      my_global_method(1,2,3)
    end
    puts exception.message
  end

  # ------------------------------------------------------------------

  def my_private_method
    "a secret"
  end
  private :my_private_method

  def test_calling_private_methods_without_receiver
    assert_equal "a secret", my_private_method
  end

  def test_calling_private_methods_with_an_explicit_receiver
    exception = assert_raise(NoMethodError) do
      self.my_private_method
    end
    puts exception.message
  end

  # ------------------------------------------------------------------

  def test_keyword_arguments
    assert_equal Array, method_with_keyword_arguments.class
    assert_equal [1, 'two'], method_with_keyword_arguments
    assert_equal ['one', 'two'], method_with_keyword_arguments(one: 'one')
    assert_equal [1, 2], method_with_keyword_arguments(two: 2)
  end

  def method_with_keyword_arguments_with_mandatory_argument(one, two: 2, three: 3)
    [one, two, three]
  end

  def test_keyword_arguments_with_wrong_number_of_arguments
    exception = assert_raise (ArgumentError) do
      method_with_keyword_arguments_with_mandatory_argument
    end
    puts exception.message
  end


end