unit uNewForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons;

type
  TForm2 = class(TForm)
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    Label18: TLabel;
    BitBtn2: TBitBtn;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    Edcitem: TEdit;
    Edunit: TEdit;
    EdCode: TEdit;
    Edname: TEdit;
    Edprice: TEdit;
    Edmax: TEdit;
    Edmin: TEdit;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EdmaxKeyPress(Sender: TObject; var Key: Char);
    procedure EdcitemKeyPress(Sender: TObject; var Key: Char);
    procedure EdunitKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    mflag:boolean;  //新增、修改标志
    munitrkey:integer;
    mcitemrkey:integer;
        
    function calsum():single;
    procedure update();
    function getCode(const pCode:string):boolean;
    function setTable(const msum:single):string;

    function setSQl(const msum:single):string;
  public
    { Public declarations }
    property Flag:boolean write mflag;
    property UnitKey:integer write munitrkey;
    property citemkey:integer write mcitemrkey;
  end;

var
  Form2: TForm2;

implementation

uses uCPCItem, uWZCPMain,uDM,uPublic;

{$R *.dfm}
//赋值给当前修改的记录
function TForm2.setTable(const msum:single):string;
var
 msql:string;
 begin
    msql:='update data0008';
    msql :=msql+' set ';
    msql:=msql+'prod_code=';
    msql :=msql +''''+ edcode.Text+''',';
    msql:=msql+' product_name=';
    msql:=msql+ ''''+ edname.Text+''',' ;
    msql:=msql+ 'pr_grp_pointer=';
    msql:=msql+ inttostr(mcitemrkey)+',';
    
    msql:=msql+'unit_ptr=';
    msql:=msql+inttostr(munitrkey)+',';
    msql:=msql+'new_price=';
     msql:=msql+edprice.Text+',';
    msql:=msql+'qty_onhand=';
    msql:=msql+floattostr(msum)+',';
    msql:=msql+'min_qty=';
    msql:=msql+edmin.Text+',';
    msql:=msql+'max_qty=';
    msql:=msql+edmax.Text ;
    msql:=msql+' where rkey=';
    msql:=msql+DataModule1.ADODataSet1RKEY.asstring;
    result:=msql;
 end;

//生成SQL语句
function TForm2.setSQl(const msum:single):string;
var
 msql:string;
 begin
    msql:='insert into data0008';
    msql :=msql+'(';
    msql:=msql+'prod_code,product_name,pr_grp_pointer,';
    msql:=msql+'unit_ptr,new_price,qty_onhand,';
    msql:=msql+'min_qty,max_qty';
    msql:=msql+')';
    msql:=msql+' values';
    msql:=msql+'(';
    msql :=msql +''''+ edcode.Text+''',';
    msql:=msql+ ''''+ edname.Text+''',' ;
    msql:=msql+ inttostr(mcitemrkey)+',';
    msql:=msql+inttostr(munitrkey)+',';
    msql:=msql+edprice.Text+',';
    msql:=msql+floattostr(msum)+',';
    msql:=msql+edmin.Text+',';
    msql:=msql+edmax.Text ;
    msql:=msql+')';
    result:=msql;
 end;
function TForm2.getCode(const pCode:string):boolean;
var
  mds:TADOdataset;
  aa:string;
begin
   //
   mds :=TADOdataset.Create(Application);
   mds.CommandType :=cmdtext;
        mds.Connection := DataModule1.ADOConnection1 ;
        mds.Active :=false;
        mds.CommandText :='SELECT * ';
        mds.CommandText :=mds.CommandText+' FROM  data0008 ';
        mds.CommandText :=mds.CommandText+' WHERE (prod_code = '''+pCode+''')';
        mds.Active :=true;
        if mds.Recordset.RecordCount >0 then
           result:=true
        else
        result:=false;
  mds.Free ;

end;
//修改产品、库存
 procedure TForm2.update();
 begin
   try
     DataModule1.ADOConnection1.BeginTrans ;
     DataModule1.ADOConnection1.Execute(setTable(calsum),cmdtext); ;

     DataModule1.ADODSCW.First ;
     //销售表、入库表已经引用
     if self.DBGrid1.Enabled =true then
     begin
      while not DataModule1.ADODSCW.Eof do
        begin
          //DataModule1.ADOTBKCMX.IndexFieldNames :=' proc_ptr;location_ptr';

          if DataModule1.ADODSCWMAX_UNIT_VALUE.value>0 then

            begin
              DataModule1.ADOTBKCMX.Filter :=
              'proc_ptr='+DataModule1.ADODataSet1RKEY.AsString +' and location_ptr='+DataModule1.ADODSCWRKEY.AsString ;
              DataModule1.ADOTBKCMX.Active :=false;
              DataModule1.ADOTBKCMX.Active :=true;
              if DataModule1.ADOTBKCMX.RecordCount >0 then  //修改
                begin
                  DataModule1.ADOTBKCMX.edit ;       //仓库明细
                  DataModule1.ADOTBKCMX.FieldByName('qty_on_hand').Value  :=DataModule1.ADODSCWMAX_UNIT_VALUE.value ;
                end
              else
                begin
                   DataModule1.ADOTBKCMX.Append ;       //仓库明细
                   DataModule1.ADOTBKCMX.FieldByName('proc_ptr').AsInteger :=DataModule1.ADODataSet1RKEY.value ;
                   DataModule1.ADOTBKCMX.FieldByName('location_ptr').AsInteger :=DataModule1.ADODSCWRKEY.Value ;
                   DataModule1.ADOTBKCMX.FieldByName('qty_on_hand').Value  :=DataModule1.ADODSCWMAX_UNIT_VALUE.value ;
                end;  
            end//eof   DataModule1.ADODSCWMAX_UNIT_VALUE.value>0
            else
              begin
                DataModule1.ADOTBKCMX.Filter :=
                'proc_ptr='+DataModule1.ADODataSet1RKEY.AsString +' and location_ptr='+DataModule1.ADODSCWRKEY.AsString ;
                DataModule1.ADOTBKCMX.Active :=false;
                DataModule1.ADOTBKCMX.Active :=true;
                if DataModule1.ADOTBKCMX.RecordCount >0 then  //删除库存为0
                   DataModule1.ADOTBKCMX.Delete ;

              end;

          DataModule1.ADODSCW.Next ;
       end;   //end do
       dataModule1.ADOTBKCMX.Post;
     end;     //end dbgrid
       //DataModule1.ADOTable1.Post;             //修改产品
       DataModule1.ADOConnection1.CommitTrans;
     except
      DataModule1.ADOConnection1.RollbackTrans;
     end;
 end;
//合计当前库存
function TForm2.calsum():single;
var
  msum:single;
 begin
      msum:=0;
      DataModule1.ADODSCW.First ;
      while not DataModule1.ADODSCW.Eof do
        begin
          if DataModule1.ADODSCWMAX_UNIT_VALUE.value>0 then
            begin
              msum :=msum+ DataModule1.ADODSCWMAX_UNIT_VALUE.value;

            end;//eof
          DataModule1.ADODSCW.Next ;
        end;  
      result:=msum;
 end;
//查找产品类型
procedure TForm2.BitBtn4Click(Sender: TObject);
var
  mColumn:TColumn;
  i:integer;
begin
 try
 //连接数据

   DataModule1.ADOTabl_search.Active :=false;
   DataModule1.ADOTabl_search.Fields.Clear ;   
   DataModule1.ADOTabl_search.TableName  :='data0007';


  DataModule1.ADOTabl_search.Active :=true;

  formCitem:=TformCitem.Create(application);


  formCitem.DataSource1.DataSet :=DataModule1.ADOTabl_search;
    //设置字段
  for i :=0 to  DataModule1.ADOTabl_search.Fields.Count -1 do
   begin
     if (formCitem.DBGrid1.Columns[i].DisplayName <>'PR_GRP_CODE') and
        (formCitem.DBGrid1.Columns[i].DisplayName<>'PRODUCT_GROUP_NAME') then
            formCitem.DBGrid1.Columns[i].Visible :=false
     else
          formCitem.DBGrid1.Columns[i].Visible :=true;
     if  formCitem.DBGrid1.Columns[i].DisplayName='PR_GRP_CODE' then
        begin
          formCitem.DBGrid1.Columns[i].Title.Caption :='编码';
          formCitem.DBGrid1.Columns[i].Width :=100;
        end;
     if  formCitem.DBGrid1.Columns[i].Title.Caption ='PRODUCT_GROUP_NAME' then
        begin
          formCitem.DBGrid1.Columns[i].Title.Caption :='名称';
          formCitem.DBGrid1.Columns[i].Width :=250;
        end;  
   end;
  formCitem.Label1.Caption :='产品类型编码';
  formCitem.Edit1.Text := trim(Edcitem.Text);
  if DataModule1.ADOTable1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录!',mtwarning,[mbok],0);
    Edcitem.SetFocus;
   end
  else
  if formCitem.ShowModal=mrok then
   begin
    //DBEdit3.Text := DataModule1.ADOTabl_search.FieldValues['PR_GRP_CODE'];
    Edcitem.Text := DataModule1.ADOTabl_search.FieldValues['PR_GRP_CODE'];
    Edcitem.Font.Color := clwindowtext;
    label18.Caption := DataModule1.ADOTabl_search.FieldValues['PRODUCT_GROUP_NAME'];
    //DataModule1.ADOTable1PR_GRP_POINTER.Value := DataModule1.ADOTabl_search.FieldValues['rkey'];
    mcitemrkey :=DataModule1.ADOTabl_search.FieldValues['rkey'];
    Edunit.SetFocus;
   end
  else
   Edcitem.SetFocus;
   formCitem.Edit1.Text :=''
 finally
  //formCitem.free;
 end;
end;
//存货单位
procedure TForm2.BitBtn2Click(Sender: TObject);
var
 // mColumn:TColumn;
  i:integer;
begin
 try
 //连接数据
   DataModule1.ADOTabl_search.Active :=false;
   DataModule1.ADOTabl_search.Fields.Clear ;
   DataModule1.ADOTabl_search.TableName  :='data0002';


  DataModule1.ADOTabl_search.Active :=true;


  formCitem:=TformCitem.Create(application);

  formCitem.DataSource1.DataSet :=DataModule1.ADOTabl_search;
    //设置字段
  for i :=0 to  DataModule1.ADOTabl_search.Fields.Count -1 do
   begin
     if (formCitem.DBGrid1.Columns[i].DisplayName <>'UNIT_CODE') and
        (formCitem.DBGrid1.Columns[i].DisplayName<>'UNIT_NAME') then
            formCitem.DBGrid1.Columns[i].Visible :=false
     else
          formCitem.DBGrid1.Columns[i].Visible :=true;
     if  formCitem.DBGrid1.Columns[i].DisplayName='UNIT_CODE' then
        begin
          formCitem.DBGrid1.Columns[i].Title.Caption :='编码';
         formCitem.DBGrid1.Columns[i].width :=100;
        end;
     if  formCitem.DBGrid1.Columns[i].Title.Caption ='UNIT_NAME' then
        begin
          formCitem.DBGrid1.Columns[i].Title.Caption :='名称';
          formCitem.DBGrid1.Columns[i].width :=250;
        end;
   end;

  formCitem.Label1.Caption :='产品单位编码';
  formCitem.Edit1.Text := trim(Edunit.Text);


  if formCitem.ShowModal=mrok then
   begin
       if DataModule1.ADOTabl_search.IsEmpty then
         begin
            messagedlg('没有找到符合条件的记录!',mtwarning,[mbok],0);
            Edunit.SetFocus;
            exit;
         end;
       //DBEdit4.Text := DataModule1.ADOTabl_search.FieldValues['UNIT_CODE'];
       Edunit.Text := DataModule1.ADOTabl_search.FieldValues['UNIT_CODE'];
       Edunit.Font.Color := clwindowtext;
       label9.Caption := DataModule1.ADOTabl_search.FieldValues['UNIT_NAME'];
       //DataModule1.ADOTable1unit_ptr.Value :=  DataModule1.ADOTabl_search.FieldValues['RKEY'];
       munitrkey :=DataModule1.ADOTabl_search.FieldValues['RKEY'];
       edmax.SetFocus;
   end
   else
   Edunit.SetFocus;
   formCitem.Edit1.Text :=''
 finally
  formCitem.free;
end;
end;
//保存
procedure TForm2.BitBtn1Click(Sender: TObject);
var
  mrkey:integer;
  mds:TADOdataset;
begin
    if  Edcode.Text='' then
      begin
        showmessage('产品编码不能为空！！！');
        Exit;
      end;
    if mflag =true then  //是否重复
      begin
       if getCode(Edcode.Text)=true then
          begin
            showmessage('产品编码已经存在！！！');
            Exit;
          end;
      end;
    if Edname.Text ='' then
       begin
        showmessage('产品名称不能为空！！！');
        Exit;
       end;
    if edcitem.Text ='' then
       begin
        showmessage('产品类型不能为空！！！');
        exit;
       end;
    if edunit.Text ='' then
       begin
        showmessage('产品单位不能为空！！！');
        exit;
       end;
  if mflag =true then  //新增
    begin
    try

     DataModule1.ADOConnection1.BeginTrans ;
     //DataModule1.ADOTable1qty_onhand.Value := calsum ;
     //showmessage(inttostr(DataModule1.ADOTable1.RecordCount));
     //showmessage('rkey:'+inttostr(DataModule1.ADOTable1RKEY.value));
     //DataModule1.ADOTable1.Post;             //新增产品
    // showmessage(inttostr(DataModule1.ADOTable1.RecordCount));
    // showmessage('rkey:'+inttostr(DataModule1.ADOTable1RKEY.value));

     DataModule1.ADOConnection1.Execute(setSQl(calsum),cmdtext);
      //新增后获取rkey
     mds :=TADOdataset.Create(Application);
     mds.CommandType :=cmdtext;
     mds.Connection := DataModule1.ADOConnection1 ;
     mds.CommandText :='select max(rkey) as rkey from data0008 ';
     mds.Active :=true;


     DataModule1.ADODSCW.First ;
     DataModule1.ADOTBKCMX.open;
      while not DataModule1.ADODSCW.Eof do
        begin
          if DataModule1.ADODSCWMAX_UNIT_VALUE.value>0 then
            begin
              DataModule1.ADOTBKCMX.Append ;       //仓库明细
              DataModule1.ADOTBKCMX.FieldByName('proc_ptr').AsInteger :=mds.FieldByName('rkey').AsInteger; ;
              DataModule1.ADOTBKCMX.FieldByName('location_ptr').AsInteger :=DataModule1.ADODSCWRKEY.Value ;
              DataModule1.ADOTBKCMX.FieldByName('qty_on_hand').Value  :=DataModule1.ADODSCWMAX_UNIT_VALUE.value ;
              DataModule1.ADOTBKCMX.Post;
           // DataModule1.ADOTable1qty_onhand.Value :=DataModule1.ADOTable1qty_onhand.Value+ DataModule1.ADODSCWMAX_UNIT_VALUE.value;

            end;//eof
          DataModule1.ADODSCW.Next;
        end;
      DataModule1.ADOConnection1.CommitTrans;

      mrkey:=mds.FieldByName('rkey').AsInteger ;
      DataModule1.ADODataSet1.Active :=false ;
      DataModule1.ADODataSet1.active :=true;
      DataModule1.ADODataSet1.IndexFieldNames := 'rkey';
      DataModule1.ADODataSet1.Locate(DataModule1.ADODataSet1.IndexFieldNames,mrkey,[lopartialkey]);
      //屏蔽删除、修改
      if DataModule1.ADODataSet1.RecordCount =0 then
        begin
          Form1.n2.Enabled :=false;
          Form1.n3.Enabled :=false;
          Form1.BitBtn3.Enabled :=false;
          Form1.BitBtn4.Enabled :=false;
        end
     else
        begin
           Form1.n2.Enabled :=true;
           Form1.n3.Enabled :=true;
          Form1.BitBtn3.Enabled :=true;
          Form1.BitBtn4.Enabled :=true;
        end;
     except

        on E: Exception do
        begin
         showmessage(E.Message);
         DataModule1.ADOConnection1.RollbackTrans;
        end;
     end;
    end   //end新增

  else
    begin

    update();  //修改
    mrkey:=DataModule1.ADODataSet1RKEY.AsInteger ;
    DataModule1.ADODataSet1.Active :=false ;
    DataModule1.ADODataSet1.active :=true;
    DataModule1.ADODataSet1.IndexFieldNames := 'rkey' ;
    DataModule1.ADODataSet1.Locate(DataModule1.ADODataSet1.IndexFieldNames,mrkey,[lopartialkey]);

    end;
 
    self.Close ;
end;
//退出
procedure TForm2.BitBtn3Click(Sender: TObject);
begin
    DataModule1.ADOTable1.active :=false;

    self.Close ;
end;
procedure TForm2.FormActivate(Sender: TObject);
var
    mstr:widestring;
    mTB:TADOTABLE;
    mi53,mi63:integer;
begin
     {if mflag =false then
        begin
          //锁定库存量
          mTB :=TADOTABLE.Create(self);
          mstr :='select * from data0053 where cust_part_ptr='+DataModule1.ADOTable1RKEY.AsString ;
          DataModule1.ADOConnection1.Execute(mstr,mi53);
          mstr :='select * from data0063 where part_batch_ptr='+DataModule1.ADOTable1RKEY.AsString ;
          DataModule1.ADOConnection1.Execute(mstr,mi63);
          IF (mi63 =0) and (mi63=0) then           //进出表未用到
            begin
              //showmessage('进仓、出仓未用到');
              self.DBGrid1.Enabled :=true;
            end
          else
            self.DBGrid1.Enabled :=false;
        end
      else
        self.DBGrid1.Enabled :=true;}
end;

procedure TForm2.EdmaxKeyPress(Sender: TObject; var Key: Char);
begin
 if  checkchar(TEdit(Sender).Text, key)=false then
    begin
      showmessage('输入数据不对！！！');
      abort;
    end;
end;

procedure TForm2.EdcitemKeyPress(Sender: TObject; var Key: Char);
begin
abort;
end;

procedure TForm2.EdunitKeyPress(Sender: TObject; var Key: Char);
begin
abort;
end;

end.
