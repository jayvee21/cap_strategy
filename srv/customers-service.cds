using {cap.strategy.db as db} from '../db/schema';

service CustomerService {
    entity Orders as projection on db.Orders;
}
