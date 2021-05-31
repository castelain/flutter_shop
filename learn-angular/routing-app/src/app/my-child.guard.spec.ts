import { TestBed } from '@angular/core/testing';

import { MyChildGuard } from './my-child.guard';

describe('MyChildGuard', () => {
  let guard: MyChildGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(MyChildGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
