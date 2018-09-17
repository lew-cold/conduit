defmodule Conduit.AggregateCase do
    @moduledoc """
    Thus module defines the test cases used in the aggregate tests.
    """

    use ExUnit.CaseTemplate

    using [aggregate: aggregate] do
        quote bind_quoted: [aggregate: aggregate] do
            @aggregate_module aggregate

            import Conduit.Factory

            # Assert the expected events are returned when the given commands have been exec
            defp assert_events(commands, expected_events) do
                assert execute(List.wrap(commands)) == expected_events
            end

            # Execute one or more commands against an aggregate
            defp execute(commands) do
                {_, events} = Enum.reduce(commands, {%@aggregate_module{}, []}, fn (command, {aggregate, _})
                
                    events = @aggregate_module.execute(aggregate, command)
                    
                    {evolve(aggregate, events), events}
                  end)
                List.wrap(events)
            end

            # Apply the given events to the aggregate state
            defp evolve(aggregate, events) do
                events
                  |> List.wrap()
                  |> Enum.reduce(aggregate, &@aggregate_module.apply(&2, &1))
            end
        end
    end
end