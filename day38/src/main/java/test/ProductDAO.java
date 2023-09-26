package test;

import java.util.ArrayList;

public class ProductDAO {
	
	ArrayList<ProductVO> datas;
	
	public ProductDAO() {
		datas = new ArrayList<ProductVO>();
		datas.add(new ProductVO(1, "티셔츠", 2000));
		datas.add(new ProductVO(2, "목도리", 1500));
		datas.add(new ProductVO(3, "청바지", 3000));
		datas.add(new ProductVO(4, "운동화", 2500));
		datas.add(new ProductVO(5, "가방", 500));
	}
	
	public boolean insert(ProductVO vo) {
		return false;
	}
	
	public boolean update(ProductVO vo) {
		return false;
	}
	
	public boolean delete(ProductVO vo) {
		return false;
	}
	
	public ProductVO selectOne(ProductVO vo) {
		ProductVO pVO = new ProductVO();
		for (ProductVO v : datas) {
			if (v.getPk() == vo.getPk()) {
				pVO = v;
				return pVO;
			}
		}
		
		return null;
	}
	
	public ArrayList<ProductVO> selectAll(ProductVO vo) {
		return datas;
	}
}
