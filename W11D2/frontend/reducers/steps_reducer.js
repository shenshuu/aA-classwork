import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from "../actions/step_actions"
import { receiveSteps, receiveStep, removeStep } from "../actions/step_actions";

const initialState = {};

window.receiveStep = receiveStep;
window.receiveSteps = receiveSteps;
window.removeStep = removeStep;

export const stepsReducer = (state=initialState, action) => {
    
    const nextState = Object.assign({}, initialState);

    switch(action.type) {
    case RECEIVE_STEPS:
      nextState[action.steps.id] = action.steps; 
      return nextState;
    case RECEIVE_STEP:
      nextState[action.step.id] = action.step;
      return nextState;
    case REMOVE_STEP:
      delete nextState[action.step.id]
      return nextState;
    default:
      return state;
  }

}