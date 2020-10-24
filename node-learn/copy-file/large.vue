<template>
  <div class="management-container">
    <div>
      <el-form
        ref="searchForm"
        :model="searchForm"
        :inline="true"
        label-position="left"
        label-width="90px"
      >
        <el-row>
          <el-col :span="12">
            <el-form-item label="货主代码">
              &nbsp;&nbsp;&nbsp;
              <el-input v-model="searchForm.storerCode" placeholder="请输入货主代码" style="width: 27vw;" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="仓库代码">
              <el-input v-model="searchForm.whseCode" style="width: 27vw;" placeholder="请输入仓库代码" />
              <el-button
                @click="isCollapsed = !isCollapsed"
                class="expand-btn"
                type="text"
              >{{ isCollapsed? $t('btnExpand') : $t('btnCollapse') }}</el-button>
            </el-form-item>
          </el-col>
        </el-row>

        <el-collapse-transition>
          <div v-show="!isCollapsed">
            <el-row>
              <el-col :span="12">
                <el-form-item label="发货单据号">
                  <el-input
                    v-model="searchForm.orderNo"
                    placeholder="请输入发货单据号"
                    style="width: 27vw;"
                  />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="创建时间">
                  <el-date-picker
                    v-model="searchForm.dateRange"
                    type="datetimerange"
                    style="width: 27vw;"
                    :picker-options="pickerOptions"
                    range-separator="~"
                    :start-placeholder="$t('placeholderStart')"
                    :end-placeholder="$t('placeholderEnd')"
                    align="right"
                  ></el-date-picker>
                </el-form-item>
              </el-col>
            </el-row>
          </div>
        </el-collapse-transition>

        <el-form-item class="btn-group">
          <el-button
            type="primary"
            icon="el-icon-search"
            @click="handleSearch"
          >{{ $t('btnSearch') }}</el-button>
          <el-button type="default" icon="el-icon-refresh" @click="handleReset">{{ $t('btnReset') }}</el-button>
        </el-form-item>
      </el-form>
      <el-table
        ref="table"
        v-loading="loading"
        :data="tableData"
        stripe
        border
        row-key="id"
        style="width: 100%"
        :header-cell-style="getHeaderStyle"
        height="calc(100vh - 310px)"
        :row-style="{ 'line-height': 0 }"
        :cell-style="{ 'padding': 0 }"
        @header-contextmenu="contextmenu"
        @selection-change="handleSelectionChange"
      >
        <el-table-column
          fixed="left"
          type="selection"
          width="50"
          :reserve-selection="true"
          :selectable="handleSelectable"
        />
        <el-table-column
          prop="orderNo"
          v-if="colData[0].istrue"
          label="发货单据号"
          width="180"
          :show-overflow-tooltip="true"
        />
        <el-table-column
          prop="customerOrderNo"
          v-if="colData[1].istrue"
          label="客户订单号"
          width="180"
          :show-overflow-tooltip="true"
        />
        <el-table-column
          prop="resultString"
          v-if="colData[2].istrue"
          label="处理状态"
          width="150"
          :show-overflow-tooltip="true"
        />
        <el-table-column
          prop="resultMessage"
          v-if="colData[3].istrue"
          label="处理结果"
          width="180"
          :show-overflow-tooltip="true"
        />
        <el-table-column
          prop="requireTime"
          v-if="colData[4].istrue"
          label="需求时间"
          width="200"
          :show-overflow-tooltip="true"
        >
          <template slot-scope="scope">{{ scope.row.requireTime | formatDateTime }}</template>
        </el-table-column>
        <el-table-column
          prop="storerCode"
          v-if="colData[5].istrue"
          label="货主代码"
          width="150"
          :show-overflow-tooltip="true"
        />
        <el-table-column
          prop="whseCode"
          v-if="colData[6].istrue"
          label="仓库代码"
          width="150"
          :show-overflow-tooltip="true"
        />
        <el-table-column
          prop="customerName"
          v-if="colData[7].istrue"
          label="客户名称"
          width="150"
          :show-overflow-tooltip="true"
        />
        <el-table-column
          prop="customerCompany"
          v-if="colData[8].istrue"
          label="收货单位"
          width="150"
          :show-overflow-tooltip="true"
        />
        <el-table-column
          prop="customerAddress"
          v-if="colData[9].istrue"
          label="客户地址"
          width="180"
          :show-overflow-tooltip="true"
        />
        <el-table-column prop="createTime" v-if="colData[10].istrue" label="创建时间" width="200">
          <template slot-scope="scope">{{ scope.row.createTime | formatDateTime }}</template>
        </el-table-column>
        <el-table-column prop="updateTime" v-if="colData[11].istrue" label="处理时间" min-width="200">
          <template slot-scope="scope">{{ scope.row.updateTime | formatDateTime }}</template>
        </el-table-column>
        <el-table-column fixed="left" :label="$t('labelOperation')" width="60">
          <template slot-scope="scope">
            <el-button
              type="text"
              icon="el-icon-document"
              title="详情"
              @click="handleDetail(scope.row)"
            />
          </template>
        </el-table-column>
      </el-table>

      <div class="selected-count">
        当前已选中 {{ selectedItems? selectedItems.length: 0 }} 条
        <el-button
          type="primary"
          v-permission="['btn_deliveryInterface_reprocess']"
          @click="handleReprocess"
          style="marginLeft: 10px;"
        >重处理</el-button>
      </div>

      <pagination
        key="interfaceQuery"
        ref="interfaceQuery"
        :total="pagination.total"
        :page.sync="pagination.listQuery.page"
        :limit.sync="pagination.listQuery.limit"
        style="float: right; marginTop: 0; marginBottom: -20px;"
        @pagination="getList"
      />
    </div>

    <!-- colOptions：右击菜单内容 -->
    <div
      v-show="menuVisible"
      :style="{top:top+ &quot;px&quot;,left:left+ &quot;px&quot;}"
      class="select-menu"
    >
      <p>定义显示的表格列</p>
      <el-checkbox-group v-model="colOptions" :min="1">
        <el-checkbox v-for="item in colSelect" :key="item" :label="item" class="custom-checkbox" />
      </el-checkbox-group>
    </div>
    <!-- 返回页面顶部按钮 -->
    <back-to-top />
  </div>
</template>

<script>
import axios from "axios";
import Pagination from "@/components/Pagination";
import BackToTop from "@/components/BackToTop";
import { Message } from "element-ui";
import {
  stringifyObjArr,
  parseObjArr,
  stringifyArr,
  parseArr
} from "@/utils/localStorage-json";
import {
  listInterfacePage,
  reprocessInterface
} from "@/api/interface-management/delivery-interface";

export default {
  name: "DeliveryInterface",
  components: { Pagination, BackToTop },
  data() {
    return {
      loading: false,
      // 控制查询表单的展开或收起
      isCollapsed: true,
      selectedItems: [],
      // 日期控件设置数据
      pickerOptions: {
        shortcuts: [
          {
            text: this.$t("textWeek"),
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit("pick", [start, end]);
            }
          },
          {
            text: this.$t("textMonth1"),
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
              picker.$emit("pick", [start, end]);
            }
          },
          {
            text: this.$t("textMonth2"),
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
              picker.$emit("pick", [start, end]);
            }
          }
        ]
      },
      // 查询表单
      searchForm: {
        storerCode: null,
        whseCode: null,
        orderNo: null,
        dateRange: null
      },
      // 表格数据
      tableData: [],
      // 分页器设置数据
      pagination: { ...this.$global.pagination },
      pageConfig: {
        pageNum: 1,
        pageSize: 10
      },
      // 实现动态表格列数据
      // colOptions，colSelect中内容的顺序必须与表格中表头的内容顺序保持一致
      colOptions: parseArr("colOptions_interfaceQuery")
        ? parseArr("colOptions_interfaceQuery")
        : [
            "发货单据号",
            "客户订单号",
            "处理状态",
            "处理结果",
            "需求时间",
            "货主代码",
            "仓库代码",
            "客户名称",
            "收货单位",
            "客户地址",
            "创建时间",
            "处理时间"
          ],
      colSelect: [
        "发货单据号",
        "客户订单号",
        "处理状态",
        "处理结果",
        "需求时间",
        "货主代码",
        "仓库代码",
        "客户名称",
        "收货单位",
        "客户地址",
        "创建时间",
        "处理时间"
      ],
      colData: parseObjArr("colData_interfaceQuery")
        ? parseObjArr("colData_interfaceQuery")
        : [
            { title: "发货单据号", istrue: true },
            { title: "客户订单号", istrue: true },
            { title: "处理状态", istrue: true },
            { title: "处理结果", istrue: true },
            { title: "处理时间", istrue: true },
            { title: "货主代码", istrue: true },
            { title: "仓库代码", istrue: true },
            { title: "客户名称", istrue: true },
            { title: "收货单位", istrue: true },
            { title: "客户地址", istrue: true },
            { title: "创建时间", istrue: true },
            { title: "处理时间", istrue: true }
          ],
      menuVisible: false,
      top: 0,
      left: 0,
      // 默认显示记录条数
      defaultPageSize: Number(localStorage.getItem("pageSize")) || 10
    };
  },
  computed: {
    selectedIds: function() {
      return this.selectedItems.map(item => item.id);
    },
    searchData: function() {
      let form = { ...this.searchForm };
      if (!form.storerCode || !form.storerCode.trim()) {
        form.storerCode = null;
      }
      if (!form.whseCode || !form.whseCode.trim()) {
        form.whseCode = null;
      }
      if (!form.orderNo || !form.orderNo.trim()) {
        form.orderNo = null;
      }
      if (form.dateRange) {
        form.createTimeStart = form.dateRange[0];
        form.createTimeEnd = form.dateRange[1];
      }
      delete form.dateRange;
      return form;
    }
  },

  watch: {
    lang() {
      // this.setOptions()
    },
    // 动态计算要显示的数据列
    colOptions(valArr) {
      var arr = this.colSelect.filter(i => valArr.indexOf(i) < 0); // 未选中
      this.colData.filter(i => {
        if (arr.indexOf(i.title) !== -1) {
          i.istrue = false;
        } else {
          i.istrue = true;
        }
      });
      // 本地保存数据列显示与否的设置数据
      stringifyObjArr("colData_interfaceQuery", this.colData);
      stringifyArr("colOptions_interfaceQuery", valArr);
    }
  },

  created() {
    this.pagination.listQuery.limit = this.defaultPageSize;
    this.pageConfig.pageSize = this.defaultPageSize;

    // 页面初始化好以后加载必需的初始数据
    const pageConfig = {
      ...this.pageConfig
    };
    this.getTableData(pageConfig);
  },

  mounted() {
    this.$global.dragRow.call(this);
  },

  beforeUpdate() {
    // 重新布局表格
    this.$nextTick(() => {
      this.$refs.table.doLayout();
    });
  },

  methods: {
    handleSelectionChange(val) {
      this.selectedItems = val;
    },
    handleSelectable(row, index) {
      // resultType为1的 不能选中，进行重处理操作
      return row.resultType === 1 ? false : true;
    },
    // 设置表格头部样式
    getHeaderStyle({ row, column, rowIndex, columnIndex }) {
      if (rowIndex === 0) {
        return {
          "background-color": "rgba(24, 144, 255, .1)",
          "line-height": 3,
          padding: 0
        };
      }
    },
    handleSearch() {
      const pageConfig = {
        ...this.pageConfig,
        ...this.searchData
      };
      this.$nextTick(() => {
        this.$refs.interfaceQuery.resetPagination();
      });
      this.getTableData(pageConfig);
    },
    handleReset() {
      this.searchForm = { dateRange: null };
      // 重置查询表单时，连着分页器一起重置
      // 重置表格筛选条件
      this.$refs["table"].clearFilter();
      this.handleSearch();
    },

    getTableData(listConfig) {
      this.loading = true;
      listInterfacePage(listConfig)
        .then(res => {
          this.tableData = res.result.records;
          // 设置分页器
          this.pagination.total = res.result.total;
          this.loading = false;
        })
        .catch(err => {
          console.log("error: ", err);
          this.loading = false;
        });
    },
    getList(page, limit) {
      // 当分页器页码或分页数发生改变时，重新请求表格数据
      const data = { ...this.searchData };
      const pageConfig = data;
      this.pageNum = Number(page.page);
      this.pageSize = Number(page.limit);
      pageConfig.pageNum = Number(page.page);
      pageConfig.pageSize = Number(page.limit);
      this.getTableData(pageConfig);
    },
    handleReprocess() {
      if (this.selectedItems.length > 0) {
        reprocessInterface(this.selectedIds)
          .then(res => {
            Message({
              message: "重处理操作成功了！",
              type: "success",
              duration: 5 * 1000
            });
            this.$refs.table.clearSelection();
            this.handleSearch();
          })
          .catch(err => {
            Message({
              message: err,
              type: "error",
              duration: 5 * 1000
            });
          });
      } else {
        Message({
          message: "请先选择要重处理的记录！",
          type: "error",
          duration: 5 * 1000
        });
      }
    },
    // 控制表格列数据的动态显示
    contextmenu(row, event) {
      this.menuVisible = false; // 先把右键菜单关死
      this.menuVisible = true; // 显示自定义菜单
      window.event.returnValue = false; // 取消浏览器右击默认事件
      document.addEventListener("click", this.closeMenu);
      // 获取鼠标点坐标，设置右击菜单位置
      this.top = event.clientY;
      this.left = event.clientX;
    },
    closeMenu() {
      this.menuVisible = false; // 关闭右键菜单
      document.removeEventListener("click", this.closeMenu); // 取消监听事件
    },
    handleDetail(row) {
      this.$store.dispatch("interface-management/setInterfaceId", row.id);
      this.$store
        .dispatch("tagsView/delCachedView", { name: "InterfaceDetail" })
        .then(res => {
          this.$router.push("/interface-management/deliveryInterface-detail");
        });
    }
  }
};
</script>
<style lang='scss' scoped>
.management {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 30px;
    line-height: 46px;
  }
}
.form-item {
  float: left;
  margin-right: 90px;
}
.btn-group {
  float: right;
  margin-right: 0;
  // clear: both;
}
.upload-file {
  margin: 0 auto;
  display: inline-block;
  margin-left: 10vw;
}
.form-label {
  color: rgba(0, 0, 0, 0.6);
  margin-right: 10px;
}
.editForm .el-form-item {
  margin-bottom: 8px;
}
.select-menu p {
  margin: 10px auto;
}
.selected-count {
  float: left;
  margin-top: 24px;
  margin-left: 20px;
  color: rgba(0, 0, 0, 0.6);
  font-size: 16px;
}
</style>
