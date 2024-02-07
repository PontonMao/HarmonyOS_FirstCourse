
export class RankData {
  name: Resource;
  vote: string; // 票数
  id: string;

  constructor(id: string, name: Resource, vote: string) {
    this.id = id;
    this.name = name;
    this.vote = vote;
  }
}