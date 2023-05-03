<template> 
  <div class="app-container">
    <el-card class="operate-container" shadow="never">
      <i class="el-icon-tickets" style="margin-top: 5px"></i>
      <span style="margin-top: 5px">Data List</span>
      <el-button
        class="btn-add"
        @click="addProductAttrCate()"
        size="mini">
        Add
      </el-button>
    </el-card>
    <div class="table-container">
      <el-table ref="productAttrCateTable"
                style="width: 100%"
                :data="list"
                v-loading="listLoading"
                border>
        <el-table-column label="ID" width="100" align="center">
          <template slot-scope="scope">{{scope.row.id}}</template>
        </el-table-column>
        <el-table-column label="Category" align="center">
          <template slot-scope="scope">{{scope.row.name}}</template>
        </el-table-column>
        <el-table-column label="Number of Attributes" width="200" align="center">
          <template slot-scope="scope">{{scope.row.attributeCount==null?0:scope.row.attributeCount}}</template>
        </el-table-column>
        <el-table-column label="Number of Parameters" width="200" align="center">
          <template slot-scope="scope">{{scope.row.paramCount==null?0:scope.row.paramCount}}</template>
        </el-table-column>
        <el-table-column label="Setting" width="200" align="center">
          <template slot-scope="scope">
            <el-button
              size="mini"
              @click="getAttrList(scope.$index, scope.row)">Attribute List
            </el-button>
            <el-button
              size="mini"
              @click="getParamList(scope.$index, scope.row)">Parameter List
            </el-button>
          </template>
        </el-table-column>
        <el-table-column label="Operation" width="200" align="center">
          <template slot-scope="scope">
            <el-button
              size="mini"
              @click="handleUpdate(scope.$index, scope.row)">Edit
            </el-button>
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)">Delete
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="pagination-container">
      <el-pagination
        background
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        layout="total, sizes,prev, pager, next,jumper"
        :page-size="listQuery.pageSize"
        :page-sizes="[5,10,15]"
        :current-page.sync="listQuery.pageNum"
        :total="total">
      </el-pagination>
    </div>
    <el-dialog
      :title="dialogTitle"
      :visible.sync="dialogVisible"
      width="30%">
      <el-form ref="productAttrCatForm" :model="productAttrCate" :rules="rules" label-width="120px">
        <el-form-item label="Attribute Name" prop="name">
          <el-input v-model="productAttrCate.name" auto-complete="off"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="handleConfirm('productAttrCatForm')">Confirm</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
  import {fetchList,createProductAttrCate,deleteProductAttrCate,updateProductAttrCate} from '@/api/productAttrCate'

  export default {
    name: 'productAttrCateList',
    data() {
      return {
        list: null,
        total: null,
        listLoading: true,
        listQuery: {
          pageNum: 1,
          pageSize: 5
        },
        dialogVisible: false,
        dialogTitle:'',
        productAttrCate:{
          name:'',
          id:null
        },
        rules: {
          name: [
            { required: true, message: 'Type in Attribute Name', trigger: 'blur' }
          ]
        }
      }
    },
    created() {
      this.getList();
    },
    methods: {
      getList() {
        this.listLoading = true;
        fetchList(this.listQuery).then(response => {
          this.listLoading = false;
          this.list = response.data.list;
          this.total = response.data.total;
        });
      },
      addProductAttrCate() {
        // https://element.eleme.io/#/zh-CN/component/dialog
        this.dialogVisible = true;   // 显示对话框
        this.dialogTitle = "Add Attribute";
      },
      handleSizeChange(val) {
        this.listQuery.pageNum = 1;
        this.listQuery.pageSize = val;
        this.getList();
      },
      handleCurrentChange(val) {
        this.listQuery.pageNum = val;
        this.getList();
      },
      handleDelete(index, row) {
        this.$confirm('Confirm Deletion', 'Notice', {
          confirmButtonText: 'Confirm',
          cancelButtonText: 'Cancel',
          type: 'warning'
        }).then(() => {
          deleteProductAttrCate(row.id).then(response=>{
            this.$message({
              message: 'Delete Success',
              type: 'success',
              duration:1000
            });
            this.getList();
          });
        });
      },
      handleUpdate(index, row) {
        this.dialogVisible = true;
        this.dialogTitle = "Edit";
        this.productAttrCate.name = row.name;
        this.productAttrCate.id = row.id;
      },
      getAttrList(index, row) {
        this.$router.push({path: '/pms/productAttrList',query:{cid:row.id,cname:row.name,type:0}})
      },
      getParamList(index, row) {
        this.$router.push({path: '/pms/productAttrList',query:{cid:row.id,cname:row.name,type:1}})
      },
      handleConfirm(formName){
        this.$refs[formName].validate((valid) => {
          if (valid) {
            let data = new URLSearchParams();    // formdata 
            data.append("name",this.productAttrCate.name);
            // 添加
            if(this.dialogTitle==="Add Attribute"){
              createProductAttrCate(data).then(response=>{
                this.$message({
                  message: 'Add Success',
                  type: 'success',
                  duration:1000
                });
                this.dialogVisible = false;
                this.getList();
              });
            }else{
              updateProductAttrCate(this.productAttrCate.id,data).then(response=>{
                this.$message({
                  message: 'Edit Success',
                  type: 'success',
                  duration:1000
                });
                this.dialogVisible = false;
                this.getList();
              });
            }
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      }
    }
  }
</script>
<style rel="stylesheet/scss" lang="scss" scoped>
</style>


