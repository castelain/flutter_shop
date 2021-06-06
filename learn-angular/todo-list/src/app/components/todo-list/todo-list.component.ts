import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-todo-list',
  templateUrl: './todo-list.component.html',
  styleUrls: ['./todo-list.component.css'],
})
export class TodoListComponent implements OnInit {
  keyword: string = '';
  todoList: any[] = [];

  constructor() {}

  ngOnInit(): void {}

  addTodoItem(event: any): void {
    if (event.keyCode === 13) {
      this.todoList.push({
        title: this.keyword,
        isFinished: false,
      });
      this.keyword = '';
    }
  }
}
