defmodule Superior do
  @moduledoc """
    The cards game Superior (invented by Markus Heitz).
  """

  @doc """
    Provides a new deck of 52 cards.
  """
  def new_deck do
    values = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10",
              "Jack", "Queen", "King"]
    suits  = ["Spades", "Clubs", "Diamonds", "Hearts"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Deals the first card of any given deck.
    If the dealt card is the Ace of Spades the Player leaves the game,
    the card is put back into the deck and the deck is shuffled.

    ## Examples

    iex> deck1 = ["Queen of Diamonds", "6 of Hearts", "5 of Hearts", "7 of Spades"]
    iex> Superior.deal(deck1)
    iex> {hand, deck11} = Superior.deal(deck1)
    iex> hand
    ["Queen of Diamonds"]
    iex> deck11
    ["6 of Hearts", "5 of Hearts", "7 of Spades"]
    iex> deck2 = ["Ace of Spades", "2 of Spades", "3 of Spades", "4 of Spades"] 
    iex> Superior.deal deck2
    iex> {hand, deck21} = Superior.deal(deck2)
    iex> hand
    ["Game Over"]
    iex> Enum.member?(deck21, "Ace of Spades")
    true

  """
  def deal(deck) do
    case Enum.split(deck, 1) do
      { ["Ace of Spades"], _ } -> { ["Game Over"], Superior.shuffle(deck) }
      { hand, deck } -> { hand, deck }
    end
  end

end
