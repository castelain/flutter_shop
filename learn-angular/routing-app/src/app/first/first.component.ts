import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-first',
  templateUrl: './first.component.html',
  styleUrls: ['./first.component.css'],
})
export class FirstComponent implements OnInit {
  items = ['item1', 'item2', 'item3'];

  constructor() {}

  ngOnInit(): void {}
}
