unit ProdBOM_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, RzButton, ExtCtrls, RzPanel,
  DBClient, Provider, StdCtrls, Menus, ComCtrls,StrUtils; // cds,

type
  TProdBOM_frm = class(TForm)
    RzToolbar1: TRzToolbar;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    wzcp0492: TADODataSet;
    wzcp0492INV_PART_NUMBER: TStringField;
    wzcp0492INV_NAME: TStringField;
    wzcp0492INV_DESCRIPTION: TStringField;
    wzcp0492UNIT_CODE: TStringField;
    wzcp0492Rkey: TAutoIncField;
    wzcp0492D492_ptr: TIntegerField;
    wzcp0492D017_ptr: TIntegerField;
    wzcp0492STD_QTY: TBCDField;
    wzcp0492App_QTY: TBCDField;
    wzcp0492Con_QTY: TBCDField;
    ds1: TADODataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    wzcp0492QUAN_ON_HAND: TBCDField;
    wzcp0492QUAN_ASSIGN: TBCDField;
    wzcp0492D17_QUAN_ASSIGN: TBCDField;
    ADO22: TADOQuery;
    ADO22INVENTORY_PTR: TIntegerField;
    ADO22INV_PART_NUMBER: TStringField;
    ADO22INV_NAME: TStringField;
    ADO22INV_DESCRIPTION: TStringField;
    ADO22QUAN_on_hand: TBCDField;
    ADO22QUAN_TO_BE_STOCKED: TBCDField;
    ADO22ValQty: TBCDField;
    ADO22RKEY: TAutoIncField;
    ADO22CREATE_DATE: TDateTimeField;
    ADO22GRN_NUMBER: TStringField;
    ADO22SUPPLIER_NAME: TStringField;
    ADO22LOCATION: TStringField;
    ADO22UNIT_CODE: TStringField;
    ADO22EXPIRE_DATE: TDateTimeField;
    ADOCommand1: TADOCommand;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    dsp_wzcp0492: TDataSetProvider;
    cds_wzcp0492: TClientDataSet;
    cds_wzcp0492INV_PART_NUMBER: TStringField;
    cds_wzcp0492INV_NAME: TStringField;
    cds_wzcp0492INV_DESCRIPTION: TStringField;
    cds_wzcp0492QUAN_ON_HAND: TBCDField;
    cds_wzcp0492UNIT_CODE: TStringField;
    cds_wzcp0492Rkey: TAutoIncField;
    cds_wzcp0492D492_ptr: TIntegerField;
    cds_wzcp0492D017_ptr: TIntegerField;
    cds_wzcp0492STD_QTY: TBCDField;
    cds_wzcp0492App_QTY: TBCDField;
    cds_wzcp0492Con_QTY: TBCDField;
    cds_wzcp0492QUAN_ASSIGN: TBCDField;
    cds_wzcp0492D17_QUAN_ASSIGN: TBCDField;
    Button3: TButton;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Panel1: TPanel;
    wzcp0492part_name: TStringField;
    wzcp0492P_CODE: TIntegerField;
    wzcp0492production_teamname: TWideStringField;
    wzcp0492D148_PTR: TIntegerField;
    cds_wzcp0492part_name: TStringField;
    cds_wzcp0492P_CODE: TIntegerField;
    cds_wzcp0492production_teamname: TWideStringField;
    cds_wzcp0492D148_PTR: TIntegerField;
    wzcp0492EMPLOYEE_NAME: TStringField;
    cds_wzcp0492EMPLOYEE_NAME: TStringField;
    ADODataSet2: TADOQuery;
    wzcp0492wzcp0495_ptr: TIntegerField;
    cds_wzcp0492wzcp0495_ptr: TIntegerField;
    strngfldwzcp0492INV_PART_NUMBER_1: TStringField;
    strngfldwzcp0492INV_NAME_1: TStringField;
    strngfldwzcp0492INV_DESCRIPTION_1: TStringField;
    qrytemp: TADOQuery;
    strngfld_wzcp0492INV_PART_NUMBER_1: TStringField;
    strngfld_wzcp0492INV_NAME_1: TStringField;
    strngfld_wzcp0492INV_DESCRIPTION_1: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure dsp_wzcp0492GetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cds_wzcp0492ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure cds_wzcp0492FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cds_wzcp0492BeforeClose(DataSet: TDataSet);
  private
    Filter_FieldName     :string;
    Filter_Panel         :TPanel;
    Filter_Label         :TLabel;
    Filter_edit          :TEdit;
    procedure Filter_Create(ParentPanel:TPanel);
    procedure Filter_Set(ACol:TColumnEh);  //如果要使用这一功能，需要将这一方法放入DghMainTitleClick事件中
    procedure Filter_edit_Change(Sender: TObject);
    Function  SQLResultValue(ADataSet:TDataSet;ASQL:string):string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProdBOM_frm: TProdBOM_frm;

implementation

uses DAMO, main,common, Detailed_unt;

{$R *.dfm}

procedure TProdBOM_frm.Filter_edit_Change(Sender: TObject);
begin
  with cds_wzcp0492 do
  if trim(Filter_edit.Text) <> '' then
  begin
    Filtered := False;
   // Filter   := 'Filter_FieldName = %'+trim(Filter_edit.Text)+'%';
    Filtered := true;
  end
  else
    Filtered := False;
end;

procedure TProdBOM_frm.Filter_Set(ACol:TColumnEh);
begin
  with ACol do
  begin
    if GetKeyState(vk_Shift)>=0 then
    if UpperCase(ACol.FieldName)<> UpperCase(Filter_FieldName) then
    begin
      if Field.DataType in[ftString,ftWideString] then
      begin
        Filter_FieldName:= ACol.FieldName;
        Filter_Label.Caption:=  ACol.Title.Caption;

        if Assigned (Filter_edit)=False  then
        begin
          Filter_edit:=TEdit.Create(Application);
          Filter_edit.Parent:=Filter_Panel;
          Filter_edit.Top:=3;
          Filter_edit.OnChange:=Filter_edit_Change;
        end;
        Filter_edit.Text:='';
        Filter_edit.Left:= Filter_Label.Left+Filter_Label.Width+5;
        
        Filter_edit.Width:=ACol.Width;
        if  Filter_edit.Width<121 then
        Filter_edit.Width:=121  ;
        Filter_edit.Left:= Filter_Label.Left+Filter_Label.Width+5;
       // Filter_Label.Top:=9;
        Filter_Panel.Width:= Filter_Label.Width+Filter_edit.Width+300;
      end;
    end;
  end;
  //Filter_Panel.Width:= Filter_Label.Width+Filter_edit.Width+15;
end;

procedure TProdBOM_frm.Filter_Create(ParentPanel:TPanel);
begin
  Filter_Panel:=TPanel.Create(Application);
  Filter_Panel.Parent:= ParentPanel;
  Filter_Panel.Caption:='';
  Filter_Panel.Align:=alLeft;
  Filter_Panel.BevelOuter:=bvNone;
  
  Filter_Label:=TLabel.Create(Application);
  Filter_Label.Parent:=  Filter_Panel;
  Filter_Label.Left:=5;
  Filter_Label.Top:=7; 
end;

//更新BOM
procedure TProdBOM_frm.Button1Click(Sender: TObject);
var
  str_SQL,Lsql:string;
  i_D492_ptr,i_D148_ptr,w492rkey:Integer;
  j:Integer;//标识 是否原来的148已领过
begin
//对工程BOM进行汇总，先用现有的生产BOM记录进行循环，如果用量出现差异，更改生产BOM的数量；
//如果有些材料根本不存在，1如果已经有领用，修改标准用量为0，2如果没领用，删除
//用工程BOM进行汇总的结果进行循环，如果在生产BOM表没有找到，添加

   //提示先要更新物控BOM

   Lsql:='select rkey from wzcp0494 where part_ptr='+dm.ADS492.FieldByName('BOM_PTR').asstring;
   dm.qrytemp.Close;
   dm.qrytemp.SQL.Clear;
   dm.qrytemp.SQL.Text:=Lsql;
   dm.qrytemp.Open;

   if dm.qrytemp.IsEmpty then
   begin
   ShowMessage('请先更新物控BOm资料！');
   exit;
   end;

  with ADODataSet2 do    //获取最新工程BOM数据和投产数量的和
  begin
    Close;
    sql.Clear;
    sql.Text:= 'select b.INVENT_PTR as rk17, b.rkey as rk495 ,sum(b.QUAN_BOM*'+dm.ADS492.FieldByName('ISSUED_QTY').asstring+' )as STD_QTY '+
              ' from wzcp0494 a '+
              ' inner join wzcp0495 b on a.rkey=b.partBom_ptr   '+
              ' where  a.status=1  and a.part_ptr='+dm.ADS492.FieldByName('BOM_PTR').asString+
              ' group by  b.INVENT_PTR  , b.rkey  ';
    Open;
  end;

  Screen.Cursor := crHourGlass;
  try
    str_SQL:='';
    try
      if  DM.ADOConnection1.InTransaction then
      DM.ADOConnection1.RollbackTrans;
      DM.ADOConnection1.BeginTrans;
      i_D492_ptr := cds_wzcp0492.FieldByName('D492_ptr').AsInteger;
      i_D148_ptr := cds_wzcp0492.FieldByName('D148_PTR').AsInteger;
      cds_wzcp0492.DisableControls;
      with cds_wzcp0492 do
      begin
        First;
        while not Eof do       //遍历dt_wzcp0492表，
        begin
          w492rkey:=cds_wzcp0492.FieldByName('rkey').AsInteger;
          if ADODataSet2.Locate('rk17;rk495',
            VarArrayOf([FieldByName('D017_ptr').AsString,FieldByName('wzcp0495_ptr').AsString]),[]) then   //  如果在ADODataSet2中找到，且数量不同，修改
          begin

            if  ADODataSet2.FieldByName('STD_QTY').Value <> FieldByName('STD_QTY').Value then
            begin
//              Edit;
//              FieldByName('STD_QTY').Value := ADODataSet2.FieldByName('STD_QTY').Value;
//              Post;
             Lsql:='update wzcp0492 set STD_QTY= '+ADODataSet2.FieldByName('STD_QTY').asstring+' where rkey='+inttostr(w492rkey);
             qrytemp.Close;
             qrytemp.SQL.Text:=Lsql;
             qrytemp.ExecSQL;
            end;
          end
          else                  //如果在ADODataSet2中没找到,
          begin
//            Edit;
//            FieldByName('STD_QTY').Value := 0;
//            Post;
             Lsql:='update wzcp0492 set STD_QTY= 0 where rkey='+inttostr(w492rkey);
             qrytemp.Close;
             qrytemp.SQL.Text:=Lsql;
             qrytemp.ExecSQL;
            if FieldByName('App_QTY').Value = 0  then     // 已申请
            if FieldByName('Con_QTY').Value = 0  then     // 如果领用数量=0，
            if FieldByName('QUAN_ASSIGN').Value = 0  then //如果分配数量=0  QUAN_ASSIGN已分配
            begin
              // Delete; // lisa20170721
             // Continue;        //结束当前循环
            end;
          end;
          Next;
        end;
        cds_wzcp0492.Refresh;
      end;

//       if cds_wzcp0492.ApplyUpdates(0)=0 then
//       begin
        with ADODataSet2 do
        begin
          First;
          while not Eof do                     //遍历ADODataSet2表，ADODataSet2是最新的工程BOM和投产数量的和
          begin
            if cds_wzcp0492.Locate('D017_ptr;wzcp0495_ptr',
              VarArrayOf([FieldByName('rk17').asinteger,FieldByName('rk495').asinteger]),[]) =False then   //如果在原生产BOM中没找到，生成插入语句
            begin
              str_SQL := str_SQL+ 'insert into wzcp0492([D492_ptr],wzcp0495_ptr,[D017_ptr],[STD_QTY],[App_QTY],[Con_QTY],[QUAN_ASSIGN]) '+#13
                       +'values('+Dm.ADS492rkey.AsString+','+ FieldByName('rk495').AsString+','
                       + FieldByName('rk17').AsString+','+  FieldByName('STD_QTY').AsString+',0,0,0)'+#13;
            end;
            Next;
          end;
        end ;
         if  str_SQL<>'' then
        begin
          DM.ADOCommand1.CommandText := str_SQL;
          DM.ADOCommand1.Execute;
        end;

        DM.ADOConnection1.CommitTrans;
        ShowMessage('更新完毕');

//      end
//      else
//      exit;
   
    except
      on e:Exception do
      begin
        if  DM.ADOConnection1.InTransaction then
        DM.ADOConnection1.RollbackTrans;
        ShowMessage('更新失败，原因是：'+#13#10+e.Message);   // +str_SQL
      end;
    end;
  finally
    cds_wzcp0492.Close;
    cds_wzcp0492.Open;
    //cds_wzcp0492.Locate('D492_ptr;D148_ptr',VarArrayOf([i_D492_ptr,i_D148_ptr]),[]);
    cds_wzcp0492.EnableControls;
    Screen.Cursor := crDefault;
  end; 
end;

 //自动分配
procedure TProdBOM_frm.N1Click(Sender: TObject);
var
  Qty,Qty1,NAQty:real;
   rkey492:Integer;
   Lsql:string;
begin
  //1要修改4张表，
  //22表的QUAN_TO_BE_STOCKED已分配数量，
  //17表的QUAN_ASSIGN已分配数量，
  //475表quan_alloc插入记录，WZCP492表的已分配数量
  if MessageBox(Handle,'生产BOM行确定要预分配库存吗？','询问',MB_YESNO+MB_iconquestion+MB_DEFBUTTON1)=IDNO	then
    exit;

  rkey492:=cds_wzcp0492Rkey.AsInteger;
  with cds_wzcp0492 do
  begin                                    // 标准数量 - 已领用 -  已分配数量 > 0 还有未分配的需求
    if FieldByName('STD_QTY').Value - FieldByName('Con_QTY').Value - FieldByName('QUAN_ASSIGN').Value > 0 then
    begin
      try
        Qty:=FieldByName('STD_QTY').Value - FieldByName('Con_QTY').Value - FieldByName('QUAN_ASSIGN').Value;  //欠货
        ADO22.Close;
        ADO22.Parameters[0].Value:=FieldByName('D017_ptr').Value;
        ADO22.Open;
        Qty1:=0;
        if DM.ADOConnection1.InTransaction then
        DM.ADOConnection1.RollbackTrans;

        DM.ADOConnection1.BeginTrans;
        while not ADO22.Eof do
        begin
          if ADO22EXPIRE_DATE.Value < Curr_Date then  //库存材料有效期已过小于当前日期
          begin
            ADO22.Next;
            continue;
          end;

          ADO22.Edit;
          if ADO22ValQty.AsFloat < Qty then       //如果D022表的未分配数量 < 当前wzcp0492需要分配的数量
          begin
            ADO22QUAN_TO_BE_STOCKED.AsFloat := ADO22QUAN_TO_BE_STOCKED.AsFloat + ADO22ValQty.AsFloat;      //修改22表已分配的数量
            ADO22.Post;
            ADOCommand1.CommandText := 'insert into data0475(d492_ptr,rkey22,quan_alloc,alloc_userptr,alloc_datetime)'  //插入分配明细 d148_ptr
            +'values('+cds_wzcp0492rkey.AsString+','
            +ADO22RKEY.AsString+','+ADO22ValQty.AsString     //cds_wzcp0492D148_ptr.AsString
            +','+user_ptr+',getdate())';
           // ShowMessage( ADOCommand1.CommandText);
            ADOCommand1.Execute;
            Qty:=Qty-ADO22ValQty.AsFloat;
            Qty1:=Qty1+ADO22ValQty.AsFloat;
          end
          else
          begin
            ADO22QUAN_TO_BE_STOCKED.AsFloat := ADO22QUAN_TO_BE_STOCKED.AsFloat + Qty;
            ADO22.Post;
            Qty1:=Qty1+Qty;
            ADOCommand1.CommandText := 'insert into data0475(d492_ptr,rkey22,quan_alloc,alloc_userptr,alloc_datetime)' //d148_ptr
            +'values('+cds_wzcp0492rkey.AsString+','
            +ADO22RKEY.AsString+','+floatToStr(Qty)  // +cds_wzcp0492D148_ptr.AsString+','
            +','+user_ptr+',getdate())';
            //ShowMessage( ADOCommand1.CommandText);
            ADOCommand1.Execute;
            break;
          end;
          ADO22.Next;
        end;
      
        if Qty1=0 then
        begin
          DM.ADOConnection1.RollbackTrans;
          ADO22.Close;
          showmessage('此材料没有可供分配的有效库存，或是库存已过有效期。');
          exit;
        end;
        ADO22.UpdateBatch(arAll);

//        Edit;
//        FieldByName('QUAN_ASSIGN').Value := FieldByName('QUAN_ASSIGN').Value + Qty1;   //修改wzcp492表已分配的数量
//        Post;

        NAQty:=FieldByName('QUAN_ASSIGN').AsFloat + Qty1 ;
        Lsql:='update wzcp0492 set  QUAN_ASSIGN=QUAN_ASSIGN+'+floattostr(Qty1)+'  where rkey='+cds_wzcp0492.fieldbyname('rkey').AsString;//+' and wzcp0495_ptr='+cds_wzcp0492.fieldbyname('wzcp0495_ptr').asstring;
        //showmessage(Lsql);
        qrytemp.Close;
        qrytemp.SQL.Text:=Lsql;
        qrytemp.ExecSQL;
       // qrytemp.ExecSQL;
       // ShowMessage(IntToStr(qrytemp.ExecSQL));

        //if ApplyUpdates(0) = 0 then
//        if qrytemp.ExecSQL>0 then
//        begin

          cds_wzcp0492.Refresh;
         // cds_wzcp0492.Locate('rkey',rkey492,[]);
          //ShowMessage('test');
          ADOCommand1.CommandText :='update data0017 set QUAN_assign = QUAN_assign + '+floattostr(Qty1)     //修改D17表已分配的数量
            +' where rkey = '+ FieldByName('D017_ptr').AsString;
          ADOCommand1.Execute;
          DM.ADOConnection1.CommitTrans;

          if FieldByName('STD_QTY').Value - FieldByName('Con_QTY').Value - NAQty > 0 then
            showmessage('已部分分配,有效库存不足,请及时补充原材料!') ;
          ADO22.Close;
       // end;
//        else
//        begin
//          DM.ADOConnection1.RollbackTrans;
//        end;
      if not   cds_wzcp0492.Locate('rkey',rkey492,[])  then exit;
      except
        on e:Exception do
        begin
          if  DM.ADOConnection1.InTransaction then
          DM.ADOConnection1.RollbackTrans;
          ShowMessage(e.Message);
        end;
      end ;
    end;
  end;
end;

procedure TProdBOM_frm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) and (ADODataSet2.sql.Text<>'')  then
  showmessage(ADODataSet2.sql.Text);

    if (ssAlt in Shift)  and  (Key=35) then
  showmessage(cds_wzcp0492.CommandText);


//  with   (Sender as TDBGridEh).DataSource do
//  begin
//    if   DataSet is TClientDataSet then
//      showmessage((DataSet as  TClientDataSet).CommandText)  ;
//  end;
end;

Function  TProdBOM_frm.SQLResultValue(ADataSet:TDataSet;ASQL:string):string;
begin
  Result:='';
  if ADataSet is TADODataSet then
  with ADataSet as TADODataSet do
  begin
    Close;
    CommandText:=ASQL;
    Open;
    if FieldList[0].IsNull  then
      Result:=''
    else
      Result:=FieldList[0].Value;
  end;

  if ADataSet is TClientDataSet then
  with ADataSet as TClientDataSet do
  begin
    Close;
    CommandText:=ASQL;
    Open;
    if FieldList[0].IsNull  then
      Result:=''
    else
      Result:=FieldList[0].Value;
  end;

  if ADataSet is TADOQuery then
  with ADataSet as TADOQuery do
  begin
    Close;
    SQL.Text:=ASQL;
    Open;
    if FieldList[0].IsNull  then
      Result:=''
    else
      Result:=FieldList[0].Value;
  end;
end;

procedure TProdBOM_frm.N2Click(Sender: TObject);
var
  Qty:Real;
  str_SQL,Lsql:string;
  rkey492:integer;
begin
  if MessageBox(Handle,'确定要取消此材料的预分配吗？','询问',MB_YESNO+MB_iconquestion+MB_DEFBUTTON2)=IDNO	then
    exit;
    rkey492:= cds_wzcp0492Rkey.AsInteger;

  Qty:=cds_wzcp0492QUAN_ASSIGN.asfloat;
  if DM.ADOConnection1.InTransaction then
  DM.ADOConnection1.RollbackTrans;
  str_SQL :=  'select QUAN_ASSIGN from dbo.wzcp0492 where rkey = '+cds_wzcp0492rkey.AsString ;
  if Round(StrToFloat(SQLResultValue(DM.qrytemp,str_SQL))*10000) <> Round(Qty*10000) then
  begin
    ShowMessage('数据库中分配数量已发生更改，刷新后重试。');
    Exit;
  end; 
  try
    DM.ADOConnection1.BeginTrans;
    with ADOCommand1 do
    begin                                                            //将Data0022表已预留的数量恢复
      CommandText :=
      'update data0022 set QUAN_TO_BE_STOCKED = QUAN_TO_BE_STOCKED - t1.quan_alloc '+#13+
      'from data0022 join' +#13+
      '(select rkey22,sum(quan_alloc)quan_alloc from Data0475' +#13+
      'where Data0475.d492_ptr = '+cds_wzcp0492rkey.AsString +' group by rkey22)as t1' +#13 + //+' and Data0475.d148_ptr = '      +cds_wzcp0492D148_ptr.AsString+
      'on t1.rkey22 = data0022.rkey ';
      Execute;
      CommandText := 'update data0017 set QUAN_assign = QUAN_assign - '+floattostr(Qty)+' where rkey = '+cds_wzcp0492D017_ptr.AsString;
      Execute;

      CommandText :='delete from data0475  where d492_ptr = '+ cds_wzcp0492rkey.AsString;//+
                  // ' and [wzcp0495_ptr] = '+ cds_wzcp0492wzcp0495_ptr.AsString ;                    //lisa
      Execute;
    end;
    
//    cds_wzcp0492.Edit;
//    cds_wzcp0492QUAN_ASSIGN.Value := 0;
//    cds_wzcp0492.Post;

    Lsql:='update wzcp0492 set  QUAN_ASSIGN=0  where rkey='+cds_wzcp0492.fieldbyname('rkey').AsString;//+' and wzcp0495_ptr='+cds_wzcp0492.fieldbyname('wzcp0495_ptr').asstring;
    //showmessage(Lsql);
    qrytemp.Close;
    qrytemp.SQL.Text:=Lsql;
    qrytemp.ExecSQL;
    cds_wzcp0492.Refresh;
    // cds_wzcp0492.Locate('rkey',rkey492,[]) ;
     
   // if qrytemp.ExecSQL>0 then
      DM.ADOConnection1.CommitTrans ;
//    else
//    begin
//      DM.ADOConnection1.RollbackTrans;
//    end;
     if not   cds_wzcp0492.Locate('rkey',rkey492,[])  then exit;
  except
    on E:Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TProdBOM_frm.N3Click(Sender: TObject);
var
  Detailed_frm: TDetailed_frm;
begin
  if  cds_wzcp0492.IsEmpty then
  Exit;

  Detailed_frm:= TDetailed_frm.Create(Application);
  try
    Detailed_frm.ADODataSet1.CommandText := Detailed_frm.ADODataSet1.CommandText+#13+
      'where d492_ptr = '+ cds_wzcp0492rkey.AsString;  //d492_ptr = '+cds_wzcp0492D492_ptr.AsString +' and wzcp0495_ptr = '+cds_wzcp0492wzcp0495_ptr.AsString;//+' and d148_ptr = '+cds_wzcp0492d148_ptr.AsString  ;
    Detailed_frm.ADODataSet1.Open;
    Detailed_frm.ShowModal;
  finally
    Detailed_frm.Free;
  end;
  
end;

procedure TProdBOM_frm.dsp_wzcp0492GetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName:= 'wzcp0492'  ;
end;

procedure TProdBOM_frm.cds_wzcp0492ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage('保存失败，原因是：'+E.Message);
end;

procedure TProdBOM_frm.PopupMenu1Popup(Sender: TObject);
begin
  with cds_wzcp0492 do
  if StrToInt(vprev) in [2,4] then
  begin
    N1.Enabled := (FieldByName('QUAN_ASSIGN').Value <= 0 )
    and (FieldByName('STD_QTY').Value - FieldByName('Con_QTY').Value > 0 );  //标准用量 - 已领用  必须大于0
    N2.Enabled := FieldByName('QUAN_ASSIGN').Value > 0;
  end
  else
  begin
    N1.Enabled := False;
    N2.Enabled := False;
  end;
end;

procedure TProdBOM_frm.FormShow(Sender: TObject);
begin
  if  StrToInt(vprev) in [2,4]   then
  begin
    Button1.Enabled := true;   //更新BOM
    cds_wzcp0492.ReadOnly := False;
    wzcp0492    .LockType := ltReadOnly;
  end
  else
  begin
    Button1.Enabled := False;
    cds_wzcp0492.ReadOnly := true;
    wzcp0492    .LockType := ltOptimistic;
  end;
  Filter_Set(DBGridEh1.FieldColumns['INV_PART_NUMBER']);
end;

procedure TProdBOM_frm.Button2Click(Sender: TObject);
begin
  cds_wzcp0492.Refresh;
end;

procedure TProdBOM_frm.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TProdBOM_frm.Button4Click(Sender: TObject);
begin
  if not cds_wzcp0492.IsEmpty then
  if MessageBox(Handle,'确定要导出数据吗？','询问',MB_YESNO+MB_iconquestion+MB_DEFBUTTON1)=IDNO	then
    exit;
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TProdBOM_frm.DBGridEh1TitleClick(Column: TColumnEh);
var
  OldIndex: string;
begin
  inherited;      //排序
 // if GetKeyState(vk_Shift)<0 then  //实现排序要同时按下Shift键
  if  Column.Grid.DataSource.DataSet.Active then
  if  Column.Field<>nil then
  begin
    if ( Column.Field.DataType <> ftBlob)and(Column.Field.FieldKind=fkData) then
    with (Column.Grid.DataSource.DataSet as TClientDataSet) do
    begin
      OldIndex:= IndexName;
      if OldIndex <> '' then
      begin
        IndexName:= '';
        DeleteIndex(OldIndex);
      end;
      case Column.Title.SortMarker of
        smNoneEh,smUpEh  :
        begin
          AddIndex(column.Field.FieldName, Column.Field.FieldName, [ixDescending]);
          Column.Title.SortMarker:= smDownEh;
        end;
        smDownEh:
        begin
          AddIndex(column.Field.FieldName, Column.Field.FieldName, [ixPrimary]);
          Column.Title.SortMarker:= smUpEh;
        end;
      end;
      IndexName:= column.Field.FieldName;
    end;
  end;
  Filter_Set(Column);
end;

procedure TProdBOM_frm.FormCreate(Sender: TObject);
begin
  Filter_Create(Panel1);
end;

procedure TProdBOM_frm.cds_wzcp0492FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Assigned(Filter_edit) then
  if Trim(Filter_edit.Text) <>'' then
    Accept:=AnsiContainsText(
    UpperCase(DataSet.FieldByName(Filter_FieldName).AsString),
    UpperCase(Filter_edit.Text )
    ) ;
end;

procedure TProdBOM_frm.cds_wzcp0492BeforeClose(DataSet: TDataSet);
var
  i:Integer;
begin
  with   (DataSet as TClientDataSet) do
  if  IndexName<>'' then
  DeleteIndex(IndexName) ;               //清除已存在的索引

  with   DBGridEh1    do
  for i:=0 to Columns.Count-1  do      //清除表格中的排序状态
  begin
    if  Columns[i].Title.SortMarker<> smNoneEh   then
    Columns[i].Title.SortMarker:= smNoneEh;
  end;
end;

end.
