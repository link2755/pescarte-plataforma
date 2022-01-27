defmodule Fuschia.CidadeFactory do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      alias Fuschia.Entities.Cidade

      @spec cidade_factory :: Cidade.t()
      def cidade_factory do
        %Cidade{
          id_externo: Nanoid.generate_non_secure(),
          municipio: sequence(:municipio, &"Cidade #{&1}")
        }
      end
    end
  end
end