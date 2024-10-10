defmodule Challange do
  @moduledoc """
  Módulo do desafio
  """

  @spec split(
    shopping_list :: [
      {
        item :: String.t(),
        quantity :: pos_integer(),
        init_price_in_cents :: pos_integer()
      }
    ],
    emails :: [String.t()]
  ) :: [%{String.t() => non_neg_integer()}]
  def split() do
  end
end
