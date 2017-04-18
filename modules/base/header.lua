tT,p,C,T={},1,coroutine,table
function s(n,f,e)
 T.insert(tT,{n,C.create(f),(e or {})})
end
function l()
-- return T.remove(tT[cT][3],1)
end
function h(...)
 computer.pushSignal(...)
 coroutine.yield()
end
