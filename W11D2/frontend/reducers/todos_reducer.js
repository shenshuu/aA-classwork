import { RECEIVE_TODO, RECEIVE_TODOS, DELETE_TODO} from '../actions/todo_actions';
import { receiveTodo, receiveTodos, removeTodo} from '../actions/todo_actions';

window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.removeTodo = removeTodo;

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};



export const todosReducer = (state=initialState, action) => {
  Object.freeze(state);

  const nextState = Object.assign({}, state);
  // debugger;
  switch (action.type) {
    case RECEIVE_TODOS:
      nextState[action.todos.id] = action.todos;
      return nextState; 
    case RECEIVE_TODO:
      nextState[action.todo.id] =  action.todo;     
      return nextState;
    case DELETE_TODO:
      delete nextState[action.todo.id]
      return nextState;
    default:
      return state;
  }
};