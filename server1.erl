 -module(server1).
 -export([start/2, rpc/2, print/1]).

 start(Name, Mod) ->
 	register(Name, spawn(fun() -> loop(Name, Mod, Mod:init()) end)).

 rpc(Name, Request) ->
 	print("RPC:self ="),
 	print(self()),
 	Name ! {self(), Request},
 	receive
 		{Name, Response} -> Response
 	end.

 loop(Name, Mod, State) ->
 	receive
 		{From, Request} ->a
 			{Response, NewState} = Mod:handle(Request, State),
 			From ! {Name, Response},
 			loop(Name, Mod, NewState)
 	end.

 	print(X) ->
    	io:format("~p~n",[X]).