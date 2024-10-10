defmodule Challenge do
  @moduledoc """
  Módulo do desafio Store Tech
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
    unique_emails = Enum.uniq(emails)

    Enum.reduce(shopping_list, 0, fn order, acc ->
      total = order.quantity * order.init_price_in_cents
      acc + total
    end)
    |> fair_division(unique_emails)
  end

  @spec fair_division(
          shopping_total :: non_neg_integer(),
          emails :: [String.t()]
        ) :: [%{String.t() => non_neg_integer()}]
  defp fair_division(shopping_total, emails) do
    value_per_person = div(shopping_total, length(emails))
    rest = rem(shopping_total, length(emails))

    emails
    |> Enum.with_index(fn email, idx ->
      if idx < rest do
        {email, value_per_person + 1}
      else
        {email, value_per_person}
      end
    end)
    |> Map.new()
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

IO.inspect(Challenge.split(shopping_list_param, emailsParam))
