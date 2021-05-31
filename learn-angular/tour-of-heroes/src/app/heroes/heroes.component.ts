import { Component, OnInit } from '@angular/core';
import { HeroService } from '../hero.service';
import { Hero } from '../hero';

@Component({
  selector: 'app-heroes',
  templateUrl: './heroes.component.html',
  styleUrls: ['./heroes.component.css'],
})
export class HeroesComponent implements OnInit {
  heroes: Hero[] = [];

  constructor(private heroService: HeroService) {}

  ngOnInit(): void {
    this.getHeroes();
  }

  getHeroes(): void {
    this.heroService.getHeroes().subscribe((heroes) => (this.heroes = heroes));
  }

  addHero(heroName: string): void {
    const name = heroName.trim();
    if (!name) {
      return;
    }
    const newHero = { name } as Hero;
    this.heroService
      .addHero(newHero)
      .subscribe((hero) => this.heroes.push(hero));
  }

  deleteHero(hero: Hero): void {
    const id = Number(hero.id);
    this.heroService.deleteHero(id).subscribe((_) => {
      this.heroes = this.heroes.filter((hero) => hero.id !== id);
    });
  }
}
