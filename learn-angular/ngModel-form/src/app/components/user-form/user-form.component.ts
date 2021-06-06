import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-user-form',
  templateUrl: './user-form.component.html',
  styleUrls: ['./user-form.component.css'],
})
export class UserFormComponent implements OnInit {
  public cityList: string[] = ['上海', '北京', '深圳'];

  public userInfo: any = {
    username: null,
    sex: null,
    city: null,
    hobby: null,
    mark: null,
    hobbyList: [
      {
        title: '吃饭',
        checked: false,
      },
      {
        title: '睡觉',
        checked: false,
      },
      {
        title: '打豆豆',
        checked: false,
      },
    ]
  };

  constructor() {}

  ngOnInit(): void {}
}
