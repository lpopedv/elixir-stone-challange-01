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
  def split(shopping_list, emails) do
      Enum.reduce(shopping_list, 0, fn order, acc ->
        total = order.quantity * order.init_price_in_cents
        acc + total
      end)
      |> fair_division(emails)
  end

  @spec fair_division(
          shopping_total :: non_neg_integer(),
          emails :: [String.t()]
        ) :: [%{String.t() => non_neg_integer()}]
  defp fair_division(shopping_total, emails) do
    share_per_person = div(shopping_total, length(emails))
    Enum.map(emails, fn email -> %{email => share_per_person} end)
  end
end

shopping_list_param = [
  %{
    item: "Item 01",
    quantity: 5,
    init_price_in_cents: 1000
  },
  %{
    item: "Item 02",
    quantity: 5,
    init_price_in_cents: 1000
  },
  %{
    item: "Item 03",
    quantity: 5,
    init_price_in_cents: 100
  },
  %{
    item: "Item 04",
    quantity: 5,
    init_price_in_cents: 100
  }
]

emailsParam = [
  "jhon@doe.com",
  "jhonjr@doe.com",
  "jhonbrother@doe.com",
  "jhonsister@doe.com"
]

IO.inspect(Challange.split(shopping_list_param, emailsParam))
