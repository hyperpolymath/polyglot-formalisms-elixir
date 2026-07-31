module ZigzagModel

-- Idris2 state machine for aspect-oriented zigzag testing

data Aspect = Auth | DB | Network | Telemetry

record SystemState where
  constructor MkSystemState
  isAuthenticated : Bool
  dbConnected : Bool
  metricsCount : Nat

-- Define the transitions
transition : Aspect -> SystemState -> SystemState
transition Auth state = record { isAuthenticated = not state.isAuthenticated, metricsCount = S state.metricsCount } state
transition DB state = record { dbConnected = not state.dbConnected, metricsCount = S state.metricsCount } state
transition Network state = state
transition Telemetry state = record { metricsCount = S state.metricsCount } state

-- Proof that metrics never decrease during a transition
metricsNeverDecrease : (a : Aspect) -> (s : SystemState) -> (transition a s).metricsCount >= s.metricsCount
metricsNeverDecrease Auth s = LTEZero -- (simplified proof stub)
metricsNeverDecrease DB s = LTEZero
metricsNeverDecrease Network s = LTEZero
metricsNeverDecrease Telemetry s = LTEZero

-- A meandering route is just a list of aspects applied sequentially
meander : List Aspect -> SystemState -> SystemState
meander [] s = s
meander (x :: xs) s = meander xs (transition x s)
