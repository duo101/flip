require "flip"

--[[

#  asdasd
 asdas
 - asda
 - asdas
 - asdasa
--]]

local Num=class(require "col")

function Num:_init(txt,pos)
  self:super(txt,pos)
  self.mu  = 0
  self.m2  = 0
  self.sd  = 0
  self.hi  = math.mininteger
  self.lo  = math.maxinteger
end

-- Anohter

function Num:__tostring()
  return string.format("Num(%s,%s)", self.mu, self.sd)
end

function Num:add (x)
  if x ~= the.ch.skip then 
    self.n  = self.n + 1
    x       = tonumber(x)
    local d = x - self.mu
    self.mu = self.mu + d / self.n
    self.m2 = self.m2 + d * (x - self.mu) 
    self.sd = self:sd0()
    self.lo = math.min(x, self.lo)
    self.hi = math.max(x, self.hi)
  end
  return x
end

function Num:sd0()
  if self.n  < 2 then return 0 end
  if self.m2 < 0 then return 0 end
  return (self.m2 / (self.n - 1))^0.5 
end

function Num:norm(x)
 
end

return Num
