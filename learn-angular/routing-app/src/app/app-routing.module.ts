import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FirstComponent } from './first/first.component';
import { SecondComponent } from './second/second.component';
import { ItemDetailComponent } from './item-detail/item-detail.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { ChildAComponent } from './child-a/child-a.component';
import { ChildBComponent } from './child-b/child-b.component';
import { MyGuard } from './my.guard';
import { MyChildGuard } from './my-child.guard';

const routes: Routes = [
  {
    path: 'first-component',
    component: FirstComponent,
    canActivate: [MyGuard],
  },
  {
    path: 'second-component',
    component: SecondComponent,
    // canActivateChild: [MyChildGuard],
    children: [
      {
        path: 'child-a',
        component: ChildAComponent,
      },
      {
        path: 'child-b',
        component: ChildBComponent,
      },
    ],
  },
  {
    path: 'item-detail/:name',
    component: ItemDetailComponent,
  },
  {
    path: '',
    redirectTo: 'first-component',
    pathMatch: 'full',
  },
  {
    path: '**',
    component: PageNotFoundComponent,
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
