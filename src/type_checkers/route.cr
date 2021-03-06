module Mint
  class TypeChecker
    def check(node : Ast::Route) : Checkable
      args = node.arguments.map do |argument|
        {argument.name.value, resolve(argument.type).as(Checkable)}
      end

      scope args do
        resolve node.expression
      end
    end
  end
end
