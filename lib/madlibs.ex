defmodule Madlibs do

  def create() do
    # call other functions
    get_answers_to_questions()
    |> insert_answers_into_story("", 0)
  end

  def get_answers_to_questions() do
    # put a blank line for readability
    IO.puts("")

    # the questions to ask
    questions = ["Please enter the name of a city: ",
      "Enter a man's name: ",
      "Give me an adjective: ",
      "Give me a verb ending in ing: "
    ]

    # ask questions and return a list of answers
    for question <- questions do
      IO.gets(question)
    end
  end

  # insert answers for all instances except the last one
  def insert_answers_into_story([head | tail], story, counter)  do

    # sentences for the story
    sentences = ["Once upon a time, in the city of #{String.trim(head)},",
      "there was a fellow named #{String.trim(head)}.",
      "He was a #{String.trim(head)} man.",
      "He was the best in the world at #{String.trim(head)}."
    ]

    # choose one sentence depending on which answer we are processing
    sentence = Enum.at(sentences, counter)

    # if the first time through, no space is needed
    story = case counter do
      0 -> "#{sentence}"
      _ -> "#{story} #{sentence}"
    end

    # add one so we move to the next answer
    counter = counter + 1

    # recurse inserting answers until done
    insert_answers_into_story(tail, story, counter)
  end

  # we are done inserting answers
  def insert_answers_into_story([], story, _)  do
    IO.puts("")
    IO.puts story
    IO.puts("")
  end

end
