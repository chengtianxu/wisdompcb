unit Frm_tree_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, DB, ADODB, ExtCtrls, StdCtrls, Grids, math,
  DBGridEh, Buttons, DBClient;

type
  TFrm_tree = class(TForm)
    tv1: TTreeView;
    il1: TImageList;
    con1: TADOConnection;
    qry1: TADOQuery;
    pnl1: TPanel;
    pnl2: TPanel;
    edt1: TEdit;
    btn1: TButton;
    pnl3: TPanel;    
    Button1: TButton;
    ds1: TDataSource;
    qry2inv_part_number: TStringField;
    qry2inv_part_description: TStringField;
    qry2inv_name: TStringField;
    qry2inv_description: TStringField;
    qry2totalcount: TFloatField;
    qry2unit_name: TStringField;
    btn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    lbl1: TLabel;
    qry2: TADOQuery;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbgrid1: TDBGridEh;
    eh2: TDBGridEh;
    ds2: TDataSource;
    qry3: TADOQuery;
    strngfld1: TStringField;
    strngfld2: TStringField;
    strngfld3: TStringField;
    strngfld4: TStringField;
    fltfld1: TFloatField;
    strngfld5: TStringField;
    qry11: TADOQuery;
    qry08: TADOQuery;
    qry140: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure CreateTree(bootnode_rkey : Integer);
    procedure CreateNode(ParentNode: TTreeNode);


    procedure CreateTree3(bootnode_rkey : Integer);
    procedure CreateNode3(ParentNode: TTreeNode);
    procedure btn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbgrid1TitleClick(Column: TColumnEh);
    procedure edt1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure tv1Expanded(Sender: TObject; Node: TTreeNode);
    procedure tv1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


    procedure pgc1Change(Sender: TObject);
    procedure eh2TitleClick(Column: TColumnEh);
    procedure eh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);      //视图 +优化
   procedure CreateTree1(bootnode_rkey : Integer);      //节点 +优化
   procedure CreateTree2(bootnode_rkey : Integer);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    invent_ptr : string;
    FsSearch:string;
    procedure addinvitem(num,desc,uname:string;total:Double);
  public
    procedure init;
  end;

var
  Frm_tree: TFrm_tree;

implementation

uses DM_u,common;

{$R *.dfm}

procedure TFrm_tree.FormCreate(Sender: TObject);
begin
  con1.ConnectionString := dm.ADOCon.ConnectionString;
  self.pgc1.ActivePageIndex:=0;
end;

procedure TFrm_tree.init;
begin
  invent_ptr:='';
  dbgrid1.Columns[0].Title.Color := clred ;
  eh2.Columns[0].Title.Color := clred ;
  CreateTree1(dm.D08RKEY.AsInteger);
  if pgc1.ActivePageIndex =0  then
  begin
  field_name := dbgrid1.Columns[0].FieldName;
  lbl1.Caption:=dbgrid1.Columns[0].Title.Caption;
  PreColumn := dbgrid1.Columns[0];

  Label1.Caption := '数据条数：'+ IntToStr(ds1.DataSet.RecordCount);
  end
  else
  begin
  field_name := eh2.Columns[0].FieldName;
  lbl1.Caption:=eh2.Columns[0].Title.Caption;
  PreColumn := eh2.Columns[0];

  Label1.Caption := '数据条数：'+ IntToStr(ds2.DataSet.RecordCount);
  end
end;



procedure TFrm_tree.CreateTree(bootnode_rkey : Integer);
var
  BootNode:TTreeNode; //根结点
  childnoderkey: Integer;
  NodeInfo: ^Integer; //rkey
begin
    tv1.Items.Clear;
    qry1.sql.text := 'select  rkey,product_name from data0008 where rkey='+inttostr(bootnode_rkey);
//    qry1.sql.text := 'select  data0008.rkey,data0008.product_name from data0008 LEFT join'+
//    ' wzcp0100 on data0008.rkey=wzcp0100.CSI_PTr left join data0073 on data0073.rkey=wzcp0100.PROC_PTR'
//    +' where (data0008.rkey='+inttostr(bootnode_rkey)
//    +' and (if_control=0)) or (if_control=1 and wzcp0100.CSI_PTr='+ inttostr(bootnode_rkey)+' and  wzcp0100.PROC_PTR='+QuotedStr(rkey73)+')';
//    ShowMessage(qry1.SQL.Text );
    qry1.open;
    New(NodeInfo);
    childnoderkey:= qry1.FieldByName('rkey').AsInteger;
    NodeInfo^:=childnoderkey;
    BootNode := tv1.Items.AddChildObject(nil,qry1.FieldByName('product_name').AsString,NodeInfo); //添加根结点，并关联根结点信息
    BootNode.ImageIndex:=0;
    qry1.Close;
    CreateNode(BootNode);
    tv1.ReadOnly:=true;
end;

procedure TFrm_tree.CreateNode(ParentNode: TTreeNode);
var
  ChildNode:TTreeNode; //孩子结点
  childnoderkey : Integer;
  invent_pt :string;
  NodeInfo:^Integer; //rkey
  QueryTmp1,QueryTmp2,QueryTmp3:TADOQuery;
begin
   QueryTmp3:=TADOQuery.Create(Self);
   QueryTmp3.Connection := con1;
   invent_pt :='';
  with QueryTmp3 do
  begin
    //QueryTmp.SQL.Clear;
    QueryTmp3.SQL.Clear;
    QueryTmp3.SQL.Text :='  select * from ('+
    'select a.invent_ptr,invent_or,c.rkey as sx,b.rkey,'+#39+'['+#39+'+c.part_name+'+#39+'] '+#39+'+ b.PRODUCT_NAME+'+#39+' '
    +#39+'+prod_code+'+#39+'*'+#39
    +#39+'【'+#39+'+replace(cast( a.quan_bom as char(10)),'+#39+' '+#39+','+#39+#39+')+'+#39+'】'+#39+' as INV_NAME '
    +' from data0148  a join data0008 b on  a.invent_ptr=b.rkey'
    +' join data0140 c  on a.part_ptr=c.rkey'+
    ' where invent_or=1 and c.part_ptr='+inttostr(Integer(ParentNode.Data^))
    +  ' union all '
    +  'select a.invent_ptr,invent_or,c.rkey as sx,b.rkey,'+#39+'['+#39+'+c.part_name+'+#39+'] '+#39+'+'+#39+'#'+#39+'+ b.inv_part_number+'+#39+' '
    +#39+'+INV_PART_DESCRIPTION+'+#39+'*'+#39
    +#39+'【'+#39+'+replace(cast( a.quan_bom as char(10)),'+#39+' '+#39+','+#39+#39+')+'+#39+'】'+#39+' as INV_NAME '
    +' from data0148  a join data0017 b on  a.invent_ptr=b.rkey'
    +' join data0140 c  on a.part_ptr=c.rkey '+
    ' where invent_or=0 and c.part_ptr='+inttostr(Integer(ParentNode.Data^))
    +') a ' +' order by sx,inv_name ';
    //ShowMessage(QueryTmp3.SQL.Text);

    QueryTmp3.Open;
//        with DM.tmp2 do
//        begin
//          Close;
//          SQL.Text := 'select a.invent_ptr,invent_or,c.rkey as sx,b.rkey,'+#39+'['+#39+'+c.part_name+'+#39+'] '+#39+'+'+#39+'#'+#39+'+ b.inv_part_number+'+#39+' '
//          +#39+'+INV_PART_DESCRIPTION+'+#39+'*'+#39
//          +#39+'【'+#39+'+replace(cast( a.quan_bom as char(10)),'+#39+' '+#39+','+#39+#39+')+'+#39+'】'+#39+' as INV_NAME '
//          +' from data0148  a join data0017 b on  a.invent_ptr=b.rkey'
//          +' join data0140 c  on a.part_ptr=c.rkey '+
//          ' where invent_or=0 and c.part_ptr='+inttostr(Integer(ParentNode.Data^));
//
//          Open;
//        end;
     while not QueryTmp3.Eof do
     begin
       New(NodeInfo);
       NodeInfo^:= QueryTmp3.FieldByName('rkey').AsInteger;
        with DM.Tmp do
        begin
          Close;
          SQL.Text := 'select CSI_PTR,PROC_PTR from wzcp0100 where CSI_PTR='+ QuotedStr(rkey73)+' and PROC_PTR='+ QuotedStr(inttostr(Integer(ParentNode.Data^)));
          Open;
        end;
        with DM.Tmp1 do
        begin
          Close;
          SQL.Text:='select * from data0008 where rkey='+QuotedStr(inttostr(Integer(ParentNode.Data^)));
          Open;
        end;


//         ShowMessage(SQL.Text);
        if (DM.Tmp1.FieldByName('if_control').Value=True) and (dm.Tmp.IsEmpty) then
        begin
//          ShowMessage('你没有权限查看改产品');
          Exit;
        end
        else
        begin
//          ShowMessage('1');
          if FieldByName('invent_or').Value=0 then
          invent_pt := invent_pt + FieldByName('invent_ptr').AsString+',';
          ChildNode := tv1.Items.AddChildObject(ParentNode,QueryTmp3.FieldByName('INV_NAME').AsString,NodeInfo);
          ChildNode.ImageIndex :=2 ;
        end;

//       ChildNode := tv1.Items.AddChildObject(ParentNode,QueryTmp3.FieldByName('INV_NAME').AsString,NodeInfo);
//       ChildNode.ImageIndex :=2 ;
       if  QueryTmp3.FieldByName('invent_or').AsInteger = 1 then
       begin
        ChildNode.ImageIndex :=3 ;
        CreateNode(ChildNode); //递归
       end;
       Next;
     end;
//     ShowMessage(invent_pt);
     invent_pt := Copy(invent_pt,1,Length(invent_pt)-1);
     if invent_ptr <> '' then
     begin
       if invent_pt<> '' then
       invent_ptr :=invent_ptr +','+#13+invent_pt
       else
       invent_ptr := invent_ptr;
     end
     else
     begin
       invent_ptr :=invent_pt;
     end;
//       ShowMessage(invent_ptr);
//       ShowMessage(invent_pt);

    with qry2 do
    begin

      Close;
      SQL.Clear;
      if invent_ptr<>'' then
      begin

//        SQL.Text := 'WITH bom_all_mt(invent_ptr,quan_bom,invent_or) '+
//        'as (select  invent_ptr,quan_bom,invent_or from  data0148 a join data0140 b'+
//        ' on a.part_ptr=b.rkey join data0008 c on b.part_ptr=c.rkey where  c.rkey='+dm.D08RKEY.AsString
//        ' UNION ALL  (select a.invent_ptr,a.quan_bom*c.quan_bom  as quan_bom,a.invent_or'+
//        ' from data0148 a join data0140 b on a.part_ptr=b.rkey join  bom_all_mt c on b.part_ptr=c.invent_ptr'+
//        ' where a.invent_or=0 and c.invent_or=1'+
//        ' UNION ALL  select a.invent_ptr,a.quan_bom*c.quan_bom as quan_bom,a.invent_or'+
//        ' from data0148 a join data0140 b on a.part_ptr=b.rkey join  bom_all_mt c on b.part_ptr=c.invent_ptr'+
//        ' where  a.invent_or=1 and c.invent_or=1 ) )'+
//        ' select inv_part_number,inv_part_description,inv_name,inv_description,c.totalcount,b.unit_name'+
//        ' from data0017 a join data0002 b on a.stock_unit_ptr=b.rkey join'+
//        ' (SELECT invent_ptr,sum(quan_bom) as totalcount FROM bom_all_mt where invent_or=0 and'+
//        ' invent_ptr in ('+invent_ptr+') group by invent_ptr) c on a.rkey=c.invent_ptr';

        sql.Add(Format('declare @sql nvarchar(max)' +
          #13#10 + 'set @sql=''' + #13#10 +
          'WITH bom_all_mt(invent_ptr,quan_bom,invent_or)' + #13#10
          + 'as (' + #13#10 +
          'select  invent_ptr,quan_bom,invent_or from  data0148 a '
          + #13#10 + ' join data0140 b on a.part_ptr=b.rkey' +
          #13#10 + ' join data0008 c on b.part_ptr=c.rkey' + #13#10
          + 'where  c.rkey= %d ' + #13#10 + 'UNION ALL ' + #13#10 +
          '(' + #13#10 +
          'select a.invent_ptr,a.quan_bom*c.quan_bom  as quan_bom,a.invent_or '
          + #13#10 + 'from data0148 a' + #13#10 +
          'join data0140 b on a.part_ptr=b.rkey ' + #13#10 +
          'join  bom_all_mt c on b.part_ptr=c.invent_ptr' + #13#10 +
          'where a.invent_or=0 and   c.invent_or=1 ' + #13#10 +
          'UNION ALL' + #13#10 +
          'select a.invent_ptr,a.quan_bom*c.quan_bom as quan_bom,a.invent_or '
          + #13#10 + 'from data0148 a' + #13#10 +
          'join data0140 b on a.part_ptr=b.rkey ' + #13#10 +
          'join  bom_all_mt c on b.part_ptr=c.invent_ptr' + #13#10 +
          'where  a.invent_or=1 and c.invent_or=1 )' + #13#10 + ')'
          + #13#10#13#10 +
          'select inv_part_number,inv_part_description,inv_name,inv_description,c.totalcount,b.unit_name '
          + #13#10 +
          'from data0017 a join data0002 b on a.stock_unit_ptr=b.rkey'
          + #13#10 + 'join ' + #13#10 +
          '(SELECT invent_ptr,sum(quan_bom) as totalcount' + #13#10
          +
          ' FROM bom_all_mt where invent_or=0 and invent_ptr in  ( %s )'
          + #13#10 +
          ' group by invent_ptr) c on a.rkey=c.invent_ptr''' +
          #13#10 + 'exec sp_executesql @sql' + #13#10, [dm.D08RKEY.AsInteger, invent_ptr]));
//        ShowMessage(SQL.Text);


      end
      else
      begin
         sql.Add(Format('declare @sql nvarchar(4000)' +
          #13#10 + 'set @sql=''' + #13#10 +
          'WITH bom_all_mt(invent_ptr,quan_bom,invent_or)' + #13#10
          + 'as (' + #13#10 +
          'select  invent_ptr,quan_bom,invent_or from  data0148 a '
          + #13#10 + ' join data0140 b on a.part_ptr=b.rkey' +
          #13#10 + ' join data0008 c on b.part_ptr=c.rkey' + #13#10
          + 'where  c.rkey= %d ' + #13#10 + 'UNION ALL ' + #13#10 +
          '(' + #13#10 +
          'select a.invent_ptr,a.quan_bom*c.quan_bom  as quan_bom,a.invent_or '
          + #13#10 + 'from data0148 a' + #13#10 +
          'join data0140 b on a.part_ptr=b.rkey ' + #13#10 +
          'join  bom_all_mt c on b.part_ptr=c.invent_ptr' + #13#10 +
          'where a.invent_or=0 and   c.invent_or=1 ' + #13#10 +
          'UNION ALL' + #13#10 +
          'select a.invent_ptr,a.quan_bom*c.quan_bom as quan_bom,a.invent_or '
          + #13#10 + 'from data0148 a' + #13#10 +
          'join data0140 b on a.part_ptr=b.rkey ' + #13#10 +
          'join  bom_all_mt c on b.part_ptr=c.invent_ptr' + #13#10 +
          'where  a.invent_or=1 and c.invent_or=1 )' + #13#10 + ')'
          + #13#10#13#10 +
          'select inv_part_number,inv_part_description,inv_name,inv_description,c.totalcount,b.unit_name '
          + #13#10 +
          'from data0017 a join data0002 b on a.stock_unit_ptr=b.rkey'
          + #13#10 + 'join ' + #13#10 +
          '(SELECT invent_ptr,sum(quan_bom) as totalcount' + #13#10
          +
          ' FROM bom_all_mt where invent_or=0 and invent_ptr in  ( 0 )'
          + #13#10 +
          ' group by invent_ptr) c on a.rkey=c.invent_ptr''' +
          #13#10 + 'exec sp_executesql @sql' + #13#10, [dm.D08RKEY.AsInteger, invent_ptr]));
//          ShowMessage(SQL.Text);
      end;
      Open;


    end;
     QueryTmp3.Close;
  end;
end;

 //------3树结构
procedure TFrm_tree.CreateTree3(bootnode_rkey : Integer);
var
  BootNode:TTreeNode; //根结点
  childnoderkey: Integer;
  NodeInfo: ^Integer; //rkey
begin
    tv1.Items.Clear;
    qry1.sql.text := 'select  rkey,product_name from data0008 where rkey='+inttostr(bootnode_rkey);
    qry1.open;
    New(NodeInfo);
    childnoderkey:= qry1.FieldByName('rkey').AsInteger;
    NodeInfo^:=childnoderkey;
    BootNode := tv1.Items.AddChildObject(nil,qry1.FieldByName('product_name').AsString,NodeInfo); //添加根结点，并关联根结点信息
    BootNode.ImageIndex:=0;
    qry1.Close;
    CreateNode3(BootNode);
    tv1.ReadOnly:=true;
end;

procedure TFrm_tree.CreateNode3(ParentNode: TTreeNode);
var
  ChildNode:TTreeNode; //孩子结点
  grandsonnode: TTreeNode; //孙子结点
  childnoderkey: Integer;
  NodeInfo:^Integer; //rkey
  grandsonnodeinof:^Integer; //rkey
  QueryTmp1,QueryTmp2,QueryTmp3:TADOQuery;
begin
   DM.Tmp.Close;
   DM.Tmp.SQL.Text :='select CSI_PTR,PROC_PTR from wzcp0100 where CSI_PTR='+rkey73
   +' and PROC_PTR='+IntToStr(Integer(ParentNode.Data^));
   DM.Tmp.Open;
  if DM.D08if_control.AsBoolean=True and (DM.Tmp.IsEmpty) then
  begin
//    ShowMessage(DM.D08RKEY.AsString);
  end
  else
  begin
  QueryTmp1:=TADOQuery.Create(Self);
  QueryTmp1.Connection := con1;
  with QueryTmp1 do
  begin
    sql.Clear;
    SQL.Text :='select rkey,part_name from data0140 where part_ptr='+ IntToStr(Integer(ParentNode.Data^))+' order by part_name';
    QueryTmp1.Open;
    while not Eof do
    begin
      New(NodeInfo);
      childnoderkey :=FieldByName('rkey').AsInteger;
      NodeInfo^:= FieldByName('rkey').AsInteger;
      ChildNode:=tv1.Items.AddChildObject(ParentNode,FieldByName('part_name').AsString,NodeInfo); //添加孩子结点，并关联孩子结点信息
      childnode.ImageIndex:=1;
      QueryTmp2:=TADOQuery.Create(Self);
      QueryTmp2.Connection := con1;

         with QueryTmp2 do
         begin
          QueryTmp2.SQL.Clear;
          QueryTmp2.SQL.Text :='select b.inv_part_number+'+#39+' '+#39+'+INV_PART_DESCRIPTION+'+#39+'*'+#39+' +cast( a.quan_bom as char(20)) as INV_NAME  from data0148  a join data0017 b on  a.invent_ptr=b.rkey where invent_or=0 and part_ptr='+inttostr(childnoderkey)+' order by INV_NAME';
          //ShowMessage(qry2.SQL.Text);
          QueryTmp2.Open;
           while  not Eof do
           begin
             grandsonnode := tv1.Items.AddChild(childnode,FieldByName('INV_NAME').AsString);
             grandsonnode.ImageIndex :=2;
             Next;
           end;
           QueryTmp2.Close;
         end;
         QueryTmp3:=TADOQuery.Create(Self);
         QueryTmp3.Connection := con1;
           with QueryTmp3 do
         begin
          //QueryTmp.SQL.Clear;
          QueryTmp3.SQL.Text :='select b.rkey,b.product_name+'+#39+'*'+#39+' +cast( a.quan_bom as char(20)) as INV_NAME  from data0148  a join data0008 b on  a.invent_ptr=b.rkey where invent_or=1 and part_ptr='+inttostr(childnoderkey)+' order by product_name';
          QueryTmp3.Open;
           while not QueryTmp3.Eof do
           begin

                New(grandsonnodeinof);
                grandsonnodeinof^:= QueryTmp3.FieldByName('rkey').AsInteger;
                grandsonnode := tv1.Items.AddChildObject(childnode,QueryTmp3.FieldByName('INV_NAME').AsString,grandsonnodeinof);
                grandsonnode.ImageIndex :=3 ;
                CreateNode(grandsonnode); //递归
                Next;
//              end;

//             CreateNode(grandsonnode); //递归
//             Next;
           end;
           QueryTmp3.Close;
         end;

      Next;
    end;
    QueryTmp1.Close;
  end;
  end;
end;


procedure TFrm_tree.btn1Click(Sender: TObject);
begin
  CreateTree2(dm.D08RKEY.AsInteger);
end;

procedure TFrm_tree.Button1Click(Sender: TObject);
begin
  CreateTree1(dm.D08RKEY.AsInteger);
end;

procedure TFrm_tree.dbgrid1TitleClick(Column: TColumnEh);
var
  cds:TClientDataSet;
begin

   cds:=TClientDataSet(ds1.DataSet);
   if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    with cds do
    begin
      IndexDefs.Update;
      if IndexDefs.IndexOf('index1') >= 0 then
      DeleteIndex('index1');
      AddIndex('index1', Column.FieldName, [], '');
      IndexName := 'index1';
      First;
    end;

  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    with cds do
    begin
    IndexDefs.Update;
    if IndexDefs.IndexOf('index1') >= 0 then
    DeleteIndex('index1');
    AddIndex('index1', Column.FieldName, [], Column.FieldName);
    IndexName := 'index1';
    First;
    end;
  end;
 
  if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if (field_name <> column.FieldName) then
  begin
    lbl1.Caption := column.Title.Caption ;
    PreColumn.Title.Color := clBtnFace ;
    field_name := column.FieldName ;
    edt1.SetFocus;

    Column.Title.Color := clred ;
    PreColumn := column ;
    Edt1Change(Edt1);
  end else
   edt1.SetFocus;
    
end;

procedure TFrm_tree.edt1Change(Sender: TObject);
begin
  //pgc1Change(sender);
 if pgc1.ActivePageIndex=0 then
 begin
  if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edt1.text) <> '' then
    begin
      if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dbgrid1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt1.text) + '%'')'
      else if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dbgrid1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt1.text,0))+')';
    end else
      dbgrid1.DataSource.DataSet.Filter:='';
  end;
  Label1.Caption := '数据条数：'+ IntToStr(dbgrid1.DataSource.DataSet.RecordCount);
  end
  else
  begin
  if eh2.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edt1.text) <> '' then
    begin
      if eh2.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        eh2.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt1.text) + '%'')'
      else if eh2.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        eh2.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt1.text,0))+')';
    end else
      eh2.DataSource.DataSet.Filter:='';
  end;
  Label1.Caption := '数据条数：'+ IntToStr(eh2.DataSource.DataSet.RecordCount);
  end
end;

procedure TFrm_tree.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_tree.btn2Click(Sender: TObject);
begin


  if pgc1.ActivePageIndex=0 then
  begin
   // if  not qry2.IsEmpty  then
    Export_dbGridEH_to_Excel(dbgrid1,DM.D08.fieldbyname('product_name').AsString +'原材料清单');
  end
  else
  begin
   // if  not  qry3.IsEmpty  then
    Export_dbGridEH_to_Excel(eh2,DM.D08.fieldbyname('product_name').AsString +'原材料清单');

  end;

end;

procedure TFrm_tree.tv1Expanded(Sender: TObject; Node: TTreeNode);
begin
//  with DM.Tmp do
//  begin
//    Close;
//    SQL.Text := 'select CSI_PTR,PROC_PTR from wzcp0100 where CSI_PTR='+ QuotedStr(rkey73)+' and PROC_PTR='+ QuotedStr(dm.D08RKEY.AsString);
//    Open;
//  end;
////  ShowMessage(IntToStr(Integer(Node.data^)));
//  with DM.Tmp1 do
//  begin
//    Close;
//    SQL.Text :='select * from data0008 where rkey='+ IntToStr(Integer(Node.data^));
//    Open;
//  end;
//  if (DM.Tmp1.FieldByName('if_control').Value=True) and (dm.Tmp.IsEmpty) then
//  begin
//    tv1.FullCollapse;         
//    ShowMessage('你没有权限查看该产品');
//  end;
end;

procedure TFrm_tree.CreateTree1(bootnode_rkey: Integer);
var
  rnode:TTreeNode;
  fmtstr:string;
  i,j:Integer;
  iV:string;
  LNode: TTreeNode;
  LArrNode: array of TTreeNode;
  K: Integer;
begin
  tv1.Items.Clear;

  edt1.Text:='';

  if ds1.DataSet<>nil then ds1.DataSet.Free;
  ds1.DataSet:=TClientDataSet.Create(nil);
  with TClientDataSet(ds1.DataSet) do
  begin
    FieldDefs.Add('inv_part_number',ftString,20,True);
    FieldDefs.Add('inv_part_description',ftString,200,True);
    FieldDefs.Add('totalcount',ftFloat,0,True);
    FieldDefs.Add('unit_name',ftString,10,True);
    CreateDataSet;
    Open;
    Filtered:=True;
    DisableControls;
  end;

  if ds2.DataSet<>nil then ds2.DataSet.Free;
  ds2.DataSet:=TClientDataSet.Create(nil);
  with TClientDataSet(ds2.DataSet) do
  begin
    FieldDefs.Add('inv_part_number',ftString,20,True);
    FieldDefs.Add('inv_part_description',ftString,200,True);
    FieldDefs.Add('totalcount',ftFloat,0,True);
    FieldDefs.Add('unit_name',ftString,10,True);
    CreateDataSet;
    Open;
    Filtered:=True;
    DisableControls;
  end;

  qry1.Close;
  qry1.SQL.Clear;
 qry1.SQL.Text:=Format('declare @sql nvarchar(max)' +
  #13#10 + 'set @sql='''  +'with bomlist(parentptr,lvl,ior,rk08,rk140, rk148,bomname,pcs,quantity) as '
+ #13#10 +'(select  a.part_ptr, 1+0 as lvl ,b.invent_or,b.invent_ptr as rk08 ,a.rkey as rk140,b.rkey as rk148,  '
+ #13#10 +'a.part_name as bomname,b.quan_bom as pcs,b.quan_bom  as quantity '
+ #13#10 +'from data0140 as a join  '
+ #13#10 +'data0148 as b  on a.rkey =b.part_ptr '
+ #13#10 +'where  a.part_ptr= %d  '
+ #13#10 +'union all    '
+ #13#10 +'select  a.part_ptr, 1+e.lvl as lvl ,b.invent_or,b.invent_ptr,a.rkey as rk140,b.rkey as rk148,  a.part_name, '
+ #13#10 +'b.quan_bom,  b.quan_bom as quan_bom  '  // *e.quantity
+ #13#10 +'from data0140 as a                        '
+ #13#10 +'join data0148 as b  on a.rkey=b.part_ptr   '
+ #13#10 +'join  bomlist e on e.rk08= a.part_ptr  '
+ #13#10 +'where  e.ior=1)         '
+ #13#10 +'select distinct a.*,   '    //
+ #13#10 +'case when a.ior=1  then b.PRODUCT_NAME else c.inv_part_number end as code,  '
+ #13#10 +'case when a.ior=1  then b.prod_code else c.INV_PART_DESCRIPTION end as name, '
+ #13#10 +'case when a.ior=1 then  b.unit_ptr else c.stock_unit_ptr end   as u, '
+ #13#10 +'case when a.ior=1 then  bb.unit_name else  cc.unit_name  end   as  unit_name,0 as  ctrl '
+ #13#10 +'from bomlist  a     '
+ #13#10 +'left  join data0008  b on a.rk08=b.rkey'
+ #13#10 +'left join data0002 bb on b.unit_ptr=bb.rkey '
+ #13#10 +'left join data0017 c on  a.rk08=c.rkey    '
+ #13#10 +'left join data0002 cc on c.stock_unit_ptr=cc.rkey '
+ #13#10 +'order by lvl,parentptr,bomname,rk08,ior '''+
#13#10 + 'exec sp_executesql @sql' + #13#10,[bootnode_rkey]);
  qry1.Open;
 //ShowMessage(qry1.SQL.Text);
 
   qry11.Close;
   qry11.SQL.Clear;
 qry11.SQL.Text:=Format('declare @sql nvarchar(max)' +
  #13#10 + 'set @sql='''  +'with bomlist(parentptr,lvl,ior,rk08,rk140, rk148,bomname,pcs,quantity) as '
+ #13#10 +'(select  a.part_ptr, 1+0 as lvl ,b.invent_or,b.invent_ptr as rk08 ,a.rkey as rk140,b.rkey as rk148,  '
+ #13#10 +'a.part_name as bomname,b.quan_bom as pcs,b.quan_bom  as quantity '
+ #13#10 +'from data0140 as a join  '
+ #13#10 +'data0148 as b  on a.rkey =b.part_ptr '
+ #13#10 +'where  a.part_ptr= %d   '
+ #13#10 +'union all    '
+ #13#10 +'select  a.part_ptr, 1+e.lvl as lvl ,b.invent_or,b.invent_ptr,a.rkey as rk140,b.rkey as rk148,  a.part_name, '
+ #13#10 +'b.quan_bom,  b.quan_bom*e.quantity as quan_bom  '  //
+ #13#10 +'from data0140 as a                        '
+ #13#10 +'join data0148 as b  on a.rkey=b.part_ptr   '
+ #13#10 +'join  bomlist e on e.rk08= a.part_ptr  '
+ #13#10 +'where  e.ior=1)         '
+ #13#10 +'select  a.*,            '
+ #13#10 +'case when a.ior=1  then b.PRODUCT_NAME else c.inv_part_number end as code,  '
+ #13#10 +'case when a.ior=1  then b.prod_code else c.INV_PART_DESCRIPTION end as name, '
+ #13#10 +'case when a.ior=1 then  b.unit_ptr else c.stock_unit_ptr end   as u, '
+ #13#10 +'case when a.ior=1 then  bb.unit_name else  cc.unit_name  end   as  unit_name,0 as  ctrl '
+ #13#10 +'from bomlist  a     '
+ #13#10 +'left  join data0008  b on a.rk08=b.rkey'
+ #13#10 +'left join data0002 bb on b.unit_ptr=bb.rkey '
+ #13#10 +'left join data0017 c on  a.rk08=c.rkey    '
+ #13#10 +'left join data0002 cc on c.stock_unit_ptr=cc.rkey '
+ #13#10 +'where a.ior=0 '
+ #13#10 +'order by lvl,parentptr,bomname,rk08,ior '''+
 #13#10 + 'exec sp_executesql @sql' + #13#10,[bootnode_rkey]);
qry11.Open;

  
  qry08.sql.text := 'select  rkey,product_name from data0008 where rkey='+inttostr(bootnode_rkey);
  qry08.open;
  rnode:= tv1.Items.Add(nil,qry08.FieldValues['product_name']) ;
  rnode.StateIndex:=bootnode_rkey;
  rnode.ImageIndex:=0;

  qry1.first;
  while not qry1.Eof do
  begin
      Text:=Format('[%s] %s %s【%s】',[ qry1.FieldByName('bomname').AsString,
      qry1.FieldByName('code').AsString,qry1.FieldByName('name').AsString,
      qry1.FieldByName('pcs').AsString]);

    if qry1.FieldByName('lvl').AsInteger = 1 then
    begin
        LNode := tv1.Items.AddChild(rnode,Text);
         if qry1.FieldByName('ior').AsInteger=1 then
         LNode.ImageIndex:=3
         else
         LNode.ImageIndex:=2;

        LNode.Data := Pointer(qry1.FieldByName('rk08').asinteger);
        SetLength(LArrNode,Length(LArrNode)+1);
        LArrNode[High(larrnode)] := LNode;
    end else
    begin
      for K := 0 to Length(LArrNode) - 1 do
      begin
        if Integer(LArrNode[K].Data) = qry1.FieldByName('parentptr').AsInteger then
        begin

          LNode := tv1.Items.AddChild(LArrNode[K],Text);
          if qry1.FieldByName('ior').AsInteger=1 then
         LNode.ImageIndex:=3
         else
         LNode.ImageIndex:=2;
          LNode.Data := Pointer(qry1.FieldByName('rk08').asinteger);
          SetLength(LArrNode,Length(LArrNode)+1);
          LArrNode[High(larrnode)] := LNode;
          //Break;
        end;
      end;
    end;

    qry1.Next;
  end;


  {
  while not qry1.Eof do
  begin
    j:=tv1.Items.Count;
    iv:='';
    for i:=0 to j-1  do
    begin
    // if (qry1.FieldByName('rk148').AsInteger=222203)  then
      // showmessage(inttostr(j)+'-'+inttostr(i)+'-'+inttostr(tv1.Items[i].OverlayIndex)+'-'+tv1.Items[i].Text+'-'+qry1.FieldByName('rk148').AsString);
    if (tv1.Items[i].StateIndex=qry1.FieldByName('parentptr').AsInteger) then
    begin
      with tv1.Items.AddChild(tv1.Items[i],'test') do
      begin
        if qry1.FieldByName('ior').AsInteger =1 then
        begin
          ImageIndex :=3;

          Text:=Format('%s [%s] %s %s【%s】',[qry1.FieldByName('rk148').AsString,qry1.FieldByName('bomname').AsString,
          qry1.FieldByName('code').AsString,qry1.FieldByName('name').AsString,
          qry1.FieldByName('pcs').AsString]);
         // if qry1.FieldByName('ctrl').AsInteger =0 then
            StateIndex:=qry1.FieldByName('rk08').AsInteger;
        end
        else
        begin
          ImageIndex:=2;
          Text:=Format('%s [%s]#%s %s【%s】',[qry1.FieldByName('rk148').AsString,qry1.FieldByName('bomname').AsString,
          qry1.FieldByName('code').AsString,qry1.FieldByName('name').AsString,
          qry1.FieldByName('pcs').AsString]);
          StateIndex:=qry1.FieldByName('rk08').AsInteger;
         // addinvitem(qry1.FieldByName('code').AsString,qry1.FieldByName('name').AsString,qry1.FieldByName('unit_name').AsString,qry1.FieldByName('quantity').AsFloat);
        end;
       // tv1.Update;
      end;
    end;

    // iv:=iv+ inttostr(j)+'-'+inttostr(i)+'-'+inttostr(tv1.Items[i].StateIndex)+'-'+tv1.Items[i].Text+'-'+qry1.FieldByName('rk148').AsString+#13#10;
    end;
    // ShowMessage(iv);


   qry1.Next;
  end;
  }
  qry11.First;
  while not  qry11.Eof  do
  begin
   if qry11.FieldByName('ior').AsInteger =0 then
   addinvitem(qry11.FieldByName('code').AsString,qry11.FieldByName('name').AsString,qry11.FieldByName('unit_name').AsString,qry11.FieldByName('quantity').AsFloat);
  qry11.Next;
  end;

  ds1.DataSet.EnableControls;
  ds2.DataSet.EnableControls;
  tv1.Update;
end;


procedure TFrm_tree.CreateTree2(bootnode_rkey: Integer);
var
  rnode,pnode:TTreeNode;
  i,j:Integer;
  fmtstr,s:string;
  hasbom:Boolean;
   LNode: TTreeNode;
  LArrNode: array of TTreeNode;
  LArrBName: array of string;
  K: Integer;
begin

  edt1.Text:='';
  if ds1.DataSet<>nil then ds1.DataSet.Free;
  ds1.DataSet:=TClientDataSet.Create(nil);
  with TClientDataSet(ds1.DataSet) do
  begin
    FieldDefs.Add('inv_part_number',ftString,20,True);
    FieldDefs.Add('inv_part_description',ftString,200,True);
    FieldDefs.Add('totalcount',ftFloat,0,True);
    FieldDefs.Add('unit_name',ftString,10,True);
    CreateDataSet;
    Open;
    Filtered:=True;
    DisableControls;
  end;
  
    if ds2.DataSet<>nil then ds2.DataSet.Free;
  ds2.DataSet:=TClientDataSet.Create(nil);
  with TClientDataSet(ds2.DataSet) do
  begin
    FieldDefs.Add('inv_part_number',ftString,20,True);
    FieldDefs.Add('inv_part_description',ftString,200,True);
    FieldDefs.Add('totalcount',ftFloat,0,True);
    FieldDefs.Add('unit_name',ftString,10,True);
    CreateDataSet;
    Open;
    Filtered:=True;
    DisableControls;
  end;

   qry11.Close;
   qry11.SQL.Clear;
 qry11.SQL.Text:=Format('declare @sql nvarchar(max)' +
  #13#10 + 'set @sql='''  +'with bomlist(parentptr,lvl,ior,rk08,rk140, rk148,bomname,pcs,quantity) as '
+ #13#10 +'(select  a.part_ptr, 1+0 as lvl ,b.invent_or,b.invent_ptr as rk08 ,a.rkey as rk140,b.rkey as rk148,  '
+ #13#10 +'a.part_name as bomname,b.quan_bom as pcs,b.quan_bom  as quantity '
+ #13#10 +'from data0140 as a join  '
+ #13#10 +'data0148 as b  on a.rkey =b.part_ptr '
+ #13#10 +'where  a.part_ptr= %d   '
+ #13#10 +'union all    '
+ #13#10 +'select  a.part_ptr, 1+e.lvl as lvl ,b.invent_or,b.invent_ptr,a.rkey as rk140,b.rkey as rk148,  a.part_name, '
+ #13#10 +'b.quan_bom,  b.quan_bom*e.quantity as quan_bom  '  //
+ #13#10 +'from data0140 as a                        '
+ #13#10 +'join data0148 as b  on a.rkey=b.part_ptr   '
+ #13#10 +'join  bomlist e on e.rk08= a.part_ptr  '
+ #13#10 +'where  e.ior=1)         '
+ #13#10 +'select  a.*,            '
+ #13#10 +'case when a.ior=1  then b.PRODUCT_NAME else c.inv_part_number end as code,  '
+ #13#10 +'case when a.ior=1  then b.prod_code else c.INV_PART_DESCRIPTION end as name, '
+ #13#10 +'case when a.ior=1 then  b.unit_ptr else c.stock_unit_ptr end   as u, '
+ #13#10 +'case when a.ior=1 then  bb.unit_name else  cc.unit_name  end   as  unit_name,0 as  ctrl '
+ #13#10 +'from bomlist  a     '
+ #13#10 +'left  join data0008  b on a.rk08=b.rkey'
+ #13#10 +'left join data0002 bb on b.unit_ptr=bb.rkey '
+ #13#10 +'left join data0017 c on  a.rk08=c.rkey    '
+ #13#10 +'left join data0002 cc on c.stock_unit_ptr=cc.rkey '
+ #13#10 +'where a.ior=0 '
+ #13#10 +'order by lvl,parentptr,bomname,rk08,ior '''+
 #13#10 + 'exec sp_executesql @sql' + #13#10,[bootnode_rkey]);
qry11.Open;

  qry11.First;
  while not  qry11.Eof  do
  begin
   if qry11.FieldByName('ior').AsInteger =0 then
   addinvitem(qry11.FieldByName('code').AsString,qry11.FieldByName('name').AsString,qry11.FieldByName('unit_name').AsString,qry11.FieldByName('quantity').AsFloat);
  qry11.Next;
  end;


 qry1.Close;
  qry1.SQL.Clear;
 qry1.SQL.Text:=Format('declare @sql nvarchar(max)' +
  #13#10 + 'set @sql='''  +'with bomlist(parentptr,lvl,ior,rk08,rk140, rk148,bomname,pcs,quantity) as '
+ #13#10 +'(select  a.part_ptr, 1+0 as lvl ,b.invent_or,b.invent_ptr as rk08 ,a.rkey as rk140,b.rkey as rk148,  '
+ #13#10 +'a.part_name as bomname,b.quan_bom as pcs,b.quan_bom  as quantity '
+ #13#10 +'from data0140 as a join  '
+ #13#10 +'data0148 as b  on a.rkey =b.part_ptr '
+ #13#10 +'where  a.part_ptr= %d  '
+ #13#10 +'union all    '
+ #13#10 +'select  a.part_ptr, 1+e.lvl as lvl ,b.invent_or,b.invent_ptr,a.rkey as rk140,b.rkey as rk148,  a.part_name, '
+ #13#10 +'b.quan_bom,  b.quan_bom as quan_bom  '  // *e.quantity
+ #13#10 +'from data0140 as a                        '
+ #13#10 +'join data0148 as b  on a.rkey=b.part_ptr   '
+ #13#10 +'join  bomlist e on e.rk08= a.part_ptr  '
+ #13#10 +'where  e.ior=1)         '
+ #13#10 +'select distinct a.*,   '    //
+ #13#10 +'case when a.ior=1  then b.PRODUCT_NAME else c.inv_part_number end as code,  '
+ #13#10 +'case when a.ior=1  then b.prod_code else c.INV_PART_DESCRIPTION end as name, '
+ #13#10 +'case when a.ior=1 then  b.unit_ptr else c.stock_unit_ptr end   as u, '
+ #13#10 +'case when a.ior=1 then  bb.unit_name else  cc.unit_name  end   as  unit_name,0 as  ctrl '
+ #13#10 +' into #a from bomlist  a     '
+ #13#10 +'left  join data0008  b on a.rk08=b.rkey'
+ #13#10 +'left join data0002 bb on b.unit_ptr=bb.rkey '
+ #13#10 +'left join data0017 c on  a.rk08=c.rkey    '
+ #13#10 +'left join data0002 cc on c.stock_unit_ptr=cc.rkey '
+ #13#10 +' order by lvl,parentptr asc, ior desc  '    
+ #13#10 +'select * From #a    '
+ #13#10 +'union all         '
+ #13#10 +'select  distinct part_ptr as parentptr ,b.lvl as lvl ,2 as ior,part_ptr as rk08, '
+ #13#10 +'rkey as rk140, 0 as rk148,part_name ,0,0,part_name ,part_name,0 , part_name , 0 '
+ #13#10 +'From data0140 a                 '
+ #13#10 +'inner join #a b on a.rkey=b.rk140     '
+ #13#10 +'order by  lvl, parentptr  asc, ior desc  '
+ #13#10 +'drop table #a  '''+
 #13#10 + 'exec sp_executesql @sql' + #13#10,[bootnode_rkey]);
 //  showmessage(qry1.SQL.Text);

 qry1.Open;




  tv1.Items.Clear;
  
  qry08.Close;
  qry08.SQL.Clear;
  qry08.sql.text := 'select  rkey,product_name from data0008 where rkey='+inttostr(bootnode_rkey);
  qry08.open;


   rnode:= tv1.Items.Add(nil,qry08.FieldValues['product_name']) ;
  rnode.OverlayIndex:=bootnode_rkey;
  rnode.ImageIndex:=0;

  qry1.First;
  while not qry1.Eof do
  begin
  // s:= qry1.FieldByName('rk08').AsString+'-'+ qry1.FieldByName('rk140').AsString+'-'+ qry1.FieldByName('name').AsString;
   if  (qry1.FieldByName('lvl').Value=1 ) and (qry1.FieldByName('ior').Value=2)   then    //
   begin
    text:= qry1.FieldByName('bomname').Value;
    LNode:=tv1.Items.AddChild(rnode,Text);
    LNode.ImageIndex:=1;
    LNode.Data := Pointer(qry1.FieldByName('rk140').asinteger);
    //LNode.StateIndex := (qry1.FieldByName('rk08').asinteger);
    SetLength(LArrNode,Length(LArrNode)+1);
    LArrNode[High(larrnode)] := LNode;
   end
   else   if  (qry1.FieldByName('ior').Value=2)   then
   begin
    for K := 0 to Length(LArrNode) - 1 do
    if (Integer(LArrNode[K].Data) =qry1.FieldByName('parentptr').AsInteger)  then
    begin
    text:= qry1.FieldByName('bomname').Value;
    LNode:=tv1.Items.AddChild(LArrNode[K],Text);
    LNode.ImageIndex:=1;
    LNode.Data := Pointer(qry1.FieldByName('rk140').asinteger);
    //LNode.StateIndex := (qry1.FieldByName('rk08').asinteger);
    SetLength(LArrNode,Length(LArrNode)+1);
    LArrNode[High(larrnode)] := LNode;
    //break;
    end;
  end
  else  if  (qry1.FieldByName('ior').Value<>2)   then
   begin
    for K := 0 to Length(LArrNode) - 1 do
    begin
    if (  Integer(LArrNode[K].Data)  =qry1.FieldByName('rk140').AsInteger)  then
    begin
     if (qry1.FieldByName('ior').Value=1) then
     begin
    text:=  Format('%s*%s',[qry1.FieldByName('name').AsString,qry1.FieldByName('pcs').AsString]);
    LNode:=tv1.Items.AddChild(LArrNode[K],Text);
    LNode.ImageIndex:=3;
    LNode.Data := Pointer(qry1.FieldByName('rk08').asinteger);
    SetLength(LArrNode,Length(LArrNode)+1);
    LArrNode[High(larrnode)] := LNode;
   
    end
    else  //if (qry1.FieldByName('ior').Value=0) then
     begin
    text:=Format('%s %s*%s',[qry1.FieldByName('code').AsString,qry1.FieldByName('name').AsString,qry1.FieldByName('pcs').AsString]);
    LNode:=tv1.Items.AddChild(LArrNode[K],Text);
    LNode.ImageIndex:=2;
    SetLength(LArrNode,Length(LArrNode)+1);
    LArrNode[High(larrnode)] := LNode;

    end
    end;
    end;
  end;
 qry1.next;
 end;



 /////////////////////////以上重做
 {
  for K := 0 to Length(LArrNode) - 1 do
     begin
     if (Integer(LArrNode[K].Data)=qry1.FieldByName('rk140').AsInteger)  then
     begin

      if qry1.FieldByName('ior').Value=1 then
      begin
      text:=Format('%s*%s',[qry1.FieldByName('name').AsString,qry1.FieldByName('pcs').AsString]);
      LNode:=tv1.Items.AddChild(LArrNode[K],Text);
      LNode.ImageIndex:=3;
      LNode.Data := Pointer(qry1.FieldByName('rk08').asinteger);
      SetLength(LArrNode,Length(LArrNode)+1);
      LArrNode[High(larrnode)] := LNode;
      end
      else
      begin
      text:=Format('%s %s*%s',[qry1.FieldByName('code').AsString,qry1.FieldByName('name').AsString,qry1.FieldByName('pcs').AsString]);
      LNode:=tv1.Items.AddChild(LArrNode[K],Text);
      LNode.ImageIndex:=2;
      LNode.Data := Pointer(qry1.FieldByName('rk140').asinteger);
      SetLength(LArrNode,Length(LArrNode)+1);
      LArrNode[High(larrnode)] := LNode;
      end;
      end
     else  if (Integer(LArrNode[K].Data)=qry1.FieldByName('rk08').AsInteger) and  (qry1.FieldByName('ior').Value=1)   then
     begin
       text:= qry1.FieldByName('bomname').Value;
      LNode:=tv1.Items.AddChild(LArrNode[K],Text);
      LNode.ImageIndex:=1;
      LNode.Data := Pointer(qry1.FieldByName('rk140').asinteger);
      SetLength(LArrNode,Length(LArrNode)+1);
      LArrNode[High(larrnode)] := LNode;
     end;



   qry1.First;
  while not qry1.Eof do
  begin
    hasbom:=False;
    for i:=0 to tv1.Items.Count-1 do
    begin
      hasbom:=(tv1.Items[i].OverlayIndex=qry1.FieldByName('rk140').AsInteger) and (tv1.Items[i].ImageIndex=1);
      if hasbom then
      begin
        with tv1.Items.AddChild(tv1.Items[i],'test') do
        begin
          case qry1.FieldByName('ior').AsInteger of
          1:begin
              ImageIndex:=3;
              Text:=Format('%s*%s',[qry1.FieldByName('name').AsString,qry1.FieldByName('pcs').AsString]);
              if qry1.FieldByName('ctrl').AsInteger=0 then
                OverlayIndex:=qry1.fieldbyname('rk08').AsInteger;
            end;
          else
            begin
              ImageIndex:=2;
              Text:=Format('%s %s*%s',[qry1.FieldByName('code').AsString,qry1.FieldByName('name').AsString,qry1.FieldByName('pcs').AsString]);
             // addinvitem(qry1.FieldByName('code').AsString,qry1.FieldByName('name').AsString,qry1.FieldByName('unit_name').AsString,qry1.FieldByName('quantity').AsFloat);
            end;
          end;
          Break;
        end;
      end;
    end;
    if not hasbom then
    begin
      for i:=0 to tv1.Items.Count-1 do
      if (tv1.Items[i].OverlayIndex=qry1.FieldByName('parentptr').AsInteger) and (tv1.Items[i].ImageIndex<>2) then
      begin
        pnode:= tv1.Items.AddChild(tv1.Items[i],'test') ;
        with pnode do
        begin
          Text:=qry1.FieldByName('bomname').AsString;
          OverlayIndex:=qry1.FieldByName('rk140').AsInteger;
          ImageIndex:=1;
        end;
        with tv1.Items.AddChild(pnode,'test') do
        begin
          case qry1.FieldByName('ior').AsInteger of
          1:begin
              ImageIndex:=3;
              Text:=Format('%s*%s',[qry1.FieldByName('name').AsString,qry1.FieldByName('pcs').AsString]);
              if qry1.FieldByName('ctrl').AsInteger=0 then
                OverlayIndex:=qry1.fieldbyname('rk08').AsInteger;
            end;
          else
            begin
              ImageIndex:=2;
              Text:=Format('%s %s*%s',[qry1.FieldByName('code').AsString,qry1.FieldByName('name').AsString,qry1.FieldByName('pcs').AsString]);

            end;
          end;
        end;
      end;


    end;
    qry1.Next;
  end;
      }

  
  tv1.Update;
  ds1.DataSet.EnableControls;
  ds2.DataSet.EnableControls;
end;

procedure TFrm_tree.tv1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
    showmessage(qry1.SQL.Text);
end;

procedure TFrm_tree.addinvitem(num, desc, uname: string; total: Double);
begin
  with TClientDataSet(ds1.DataSet) do
  begin
    //if TClientDataSet(ds1.DataSet).active then close;
    Append;
    FieldByName('inv_part_number').AsString:=num;
    FieldByName('inv_part_description').AsString:=desc;
    FieldByName('totalcount').AsFloat:=total;
    FieldByName('unit_name').AsString:=uname;
    Post;
  end;

  //汇总：
  with TClientDataSet(ds2.DataSet) do
  begin

    if  TClientDataSet(ds2.DataSet).Locate('inv_part_number',num,[])  then
    begin
     edit;
     FieldByName('totalcount').AsFloat:=FieldByName('totalcount').AsFloat+total;
     post;
    end
    else
    begin
    Append;
    FieldByName('inv_part_number').AsString:=num;
    FieldByName('inv_part_description').AsString:=desc;
    FieldByName('totalcount').AsFloat:=total;
    FieldByName('unit_name').AsString:=uname;
    Post;
    end;
  end;




end;

procedure TFrm_tree.dbgrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
    showmessage(qry2.SQL.Text);
end;

procedure TFrm_tree.pgc1Change(Sender: TObject);
begin
//  field_name := dbgrid1.Columns[0].FieldName;
//  lbl1.Caption:=dbgrid1.Columns[0].Title.Caption;
//  PreColumn := dbgrid1.Columns[0];
//  dbgrid1.Columns[0].Title.Color := clred ;

 edt1Change(sender);



end;

procedure TFrm_tree.eh2TitleClick(Column: TColumnEh);
var
  cds:TClientDataSet;
begin

   cds:=TClientDataSet(ds2.DataSet);
   if eh2.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
 

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    with cds do
    begin
      IndexDefs.Update;
      if IndexDefs.IndexOf('index1') >= 0 then
      DeleteIndex('index1');
      AddIndex('index1', Column.FieldName, [], '');
      IndexName := 'index1';
      First;
    end;

  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    with cds do
    begin
    IndexDefs.Update;
    if IndexDefs.IndexOf('index1') >= 0 then
    DeleteIndex('index1');
    AddIndex('index1', Column.FieldName, [], Column.FieldName);
    IndexName := 'index1';
    First;
    end;
  end;

   if eh2.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
 

  if (field_name <> column.FieldName) then
  begin
    lbl1.Caption := column.Title.Caption ;
    PreColumn.Title.Color := clBtnFace ;
    field_name := column.FieldName ;
    edt1.SetFocus;

    Column.Title.Color := clred ;
    PreColumn := column ;
    Edt1Change(Edt1);
  end else
    edt1.SetFocus;

end;

procedure TFrm_tree.eh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
    showmessage(qry3.SQL.Text);
end;

end.
