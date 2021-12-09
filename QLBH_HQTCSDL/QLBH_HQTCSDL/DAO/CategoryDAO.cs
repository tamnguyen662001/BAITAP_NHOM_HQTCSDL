using QLBH_HQTCSDL.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DAO
{
    public class CategoryDAO
    {
        private static CategoryDAO instance;

        public static CategoryDAO Instance
        {
            get { if (instance == null) instance = new CategoryDAO(); return instance; }
            private set { instance = value; }
        }

        private CategoryDAO() { }

        public List<CategoryDTO> loadListCate()
        {
            List<CategoryDTO> listcate = new List<CategoryDTO>();

            
            string query = "select * from LOAI_SAN_PHAM";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                CategoryDTO cate  = new CategoryDTO(item);

                listcate.Add(cate);

            }
            return listcate;
        }
        public CategoryDTO loadCate2(string mlsp)
        {
            CategoryDTO cate = null;

            string query = "exec lsp "+ mlsp;

            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                 cate = new CategoryDTO(item);

                return cate;

            }
            return cate;
        }
    }
}
