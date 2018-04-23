defmodule Superior do
  @moduledoc """
    The cards game Superior (invented by Markus Heitz).
  """

  @doc """
    Provides a new deck of 52 cards.

    ## Examples

      iex> hd(Superior.new_deck)
      "Ace of Spades"

  """
  def new_deck do
    values = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
    suits  = ["Spades", "Clubs", "Diamonds", "Hearts"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end


end
