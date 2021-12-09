using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DTO
{
    public class CategoryDTO
    {
        public CategoryDTO(DataRow row)
        {
            this.Mlsp = row["MLSP"].ToString();
            this.Tenlsp = row["TENLSP"].ToString();
           
        }


        public CategoryDTO(string mlsp, string tenlsp)
        {
            this.Mlsp = mlsp;
            this.Tenlsp = tenlsp;

        }
        private string mlsp;

        public string Mlsp
        {
            get { return mlsp; }
            set { mlsp = value; }
        }
        private string tenlsp;

        public string Tenlsp
        {
            get { return tenlsp; }
            set { tenlsp = value; }
        }
    }
}
