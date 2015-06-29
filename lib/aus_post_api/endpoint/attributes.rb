module AusPostAPI
  class Endpoint
    # The attributes module adds a class level DSL that allows required and
    # optional attributes to be set using the same interface as `attr_accessor`
    #
    # eg.
    #     class Example
    #       include Attributes
    #
    #       required_attributes :one, :two
    #       optional_attributes :three
    #     end
    #
    # Additionally it adds two instance methods: `required_attributes` &
    # `optional_attributes` that return an array of attributes specified by the
    # two methods.
    module Attributes
      def self.included(base)
        base.extend(ClassMethods)
        base.include(InstanceMethods)
      end
    end

    module ClassMethods
      def required_attributes(*args)
        if args.empty?
          @required_attributes || []
        else
          @required_attributes = args
          self.send(:attr_accessor, *args)
        end
      end

      def optional_attributes(*args)
        if args.empty?
          @optional_attributes || []
        else
          @optional_attributes = args
          self.send(:attr_accessor, *args)
        end
      end
    end

    module InstanceMethods
      def required_attributes
        self.class.required_attributes
      end

      def optional_attributes
        self.class.optional_attributes
      end
    end
  end
end
