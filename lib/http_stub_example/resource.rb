module HttpStubExample

  class Resource

    class << self

      def many
        [
          { id: 1, name: "First Resource" },
          { id: 2, name: "Second Resource" },
          { id: 3, name: "Third Resource" }
        ]
      end

      def one
        [
          { id: 1, name: "Sole Resource" }
        ]
      end

      def created
        [
          { id: 1, name: "Created Resource" }
        ]
      end

    end

  end

end
