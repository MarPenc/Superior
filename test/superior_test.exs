defmodule SuperiorTest do
  use ExUnit.Case
  doctest Superior

  def test_deck do
    ["Two of Clubs", "Three of Diamonds"]
  end

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

  test "deals a hand of exactly one card" do
    {hand, _remaining_deck} = SuperiorTest.test_deck |> Superior.deal
    assert length(hand) == 1
  end

  test "ends game if Ace of Spades is drawn" do
    { hand, _deck } = ["Ace of Spades"] |> Superior.deal 
    assert hand == ["Game Over"]
  end

  test "returns the Ace of Spades after its been dealt" do
    { _, remaining_deck } = Superior.new_deck |> Superior.deal
    assert Enum.member?(remaining_deck, "Ace of Spades") == :true
  end

end
