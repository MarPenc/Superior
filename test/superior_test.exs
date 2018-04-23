defmodule SuperiorTest do
  use ExUnit.Case
  doctest Superior

  test "provides a deck of 52 cards" do
    assert length(Superior.new_deck) == 52
  end

  test "the deck contains the Ace of Spades card" do
    assert Enum.member?(Superior.new_deck, "Ace of Spades") == :true
  end

  test "shuffles the deck" do
    deck = Superior.new_deck
    shuffled_deck = Superior.shuffle(deck)
    refute deck == shuffled_deck
  end

  test "if requested, Superior deals a new card" do
    assert length(Superior.new_card) == 1
  end

end
