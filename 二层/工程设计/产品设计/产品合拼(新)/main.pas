unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus,db,DBClient,ADODB;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BtFlds: TBitBtn;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    btnOK: TSpeedButton;
    btnCondition: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    PMFlds: TPopupMenu;
    labelKey: TLabel;
    edtKey: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtFldsClick(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure edtKeyChange(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
  private
    { Private declarations }
    SQLRefresh,EMPName:string;//EMPName合拼人员
    vColumn:TColumnEh;
    PreColumn: TColumnEh;
    field_name,sql_text,total_sqltext:string;
    function GetData:Boolean;
    procedure AddParamsColumn;
    procedure TransferColumnToGrid2;//加载待合拼的Grid column列表
    procedure item_click(sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  USERRKEY: string;

implementation
uses common,udm,ParamSet,term,uQnty;
{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
(*
{$IFDEF Release}
  if not App_init_2(dm.con1) then
  begin
    showmsg('程序起动失败，请联系管理员！',1);
    application.Terminate;
  end;
{$ENDIF}
{$IFDEF Debug}
  dm.con1.Connected:= False;
  dm.con1.Connected:= True;
  vprev:= '4';  //4写银
  rkey73:='473';
{$ENDIF}*)

  if not App_init_2(dm.con1) then
  begin
    showmsg('程序起动失败，请联系管理员！',1);
    application.Terminate;
  end;
  self.caption:= application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';
  SQLRefresh:= ' and DATEDIFF(DAY,Convert(varchar(10),getdate(),120),Data0060.ENT_DATE)>=-3  ';
  SQLRefresh:=SQLRefresh+' and (Data0060.PROD_REL=2) and (Data0060.ISSUED_QTY=0) ';
  GetData;
  //取数据表结构，返回空数据集。
  dm.aqOrderChosen.close;
  dm.aqOrderChosen.SQL.Clear;
  dm.aqOrderChosen.SQL.Add('Exec PCBJointLayout '+QuotedStr(' and 1=2'));
  dm.aqOrderChosen.open;
  field_name := DBGridEH1.Columns[0].FieldName;
  PreColumn := DBGridEH1.Columns[0];

  AddParamsColumn;
  if not dm.con1.Connected then Exit;
  with dm.qryTmp do
  begin
   Close;
   SQL.Clear;
   SQL.Add('Select D73.EMPLOYEE_PTR,D05.ABBR_NAME from data0073 D73 left join data0005 D05 on D73.EMPLOYEE_PTR=D05.rkey');
   SQL.Add('Where D73.rkey='+rkey73);
   Open;
   USERRKEY := FieldByName('EMPLOYEE_PTR').AsString;
   EMPName := FieldByName('ABBR_NAME').AsString;
  end;
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
  if dm.aq60.Active then
    rkey:=dm.aq60.fieldbyname('rkey60').AsInteger
  else
    rkey:=0;
  if GetData then
  if rkey>0 then dm.aq60.Locate('rkey60',rkey,[]);
end;

function TfrmMain.GetData: Boolean;
begin
  try
    dm.aq60.Close;
    dm.aq60.SQL.Clear;
    dm.aq60.SQL.Add('Exec PCBJointLayout '+QuotedStr(SQLRefresh));
    dm.aq60.open;
    result:=true;
  except
    result:=False;
  end;
  if DM.aqOrderChosen.Active then
    DM.DeleteData(DM.aqOrderChosen);
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  if StrToInt(vprev) <> 4 then
  begin
    ShowMessage('无权限');
    Abort;
  end;
  frmParamSet:= TfrmParamSet.Create(Self);
  try
    with frmParamSet do
    begin
      aqParamSet.Close;
      aqParamSet.Open;
      ShowModal;
    end;
  finally
    frmParamSet.Free;
  end;
end;

procedure TfrmMain.BitBtn4Click(Sender: TObject);
var
 i:byte;
 SQL:string;
begin

  if form_condition.ShowModal=mrok then
  begin
    for i:=1 to form_condition.SGrid1.RowCount-2 do
    begin
     SQL:=SQL+ form_condition.SGrid1.Cells[2,i]+#13;
    end;
    SQL:=SQL+' and Data0060.ENT_DATE >='+ QuotedStr(formatdatetime('yyyy-mm-dd',form_condition.dtpk1.Date))+
             ' and Data0060.ENT_DATE <'+ QuotedStr(formatdatetime('yyyy-mm-dd',form_condition.dtpk2.Date+1));
    SQLRefresh:=SQL;
    SQLRefresh:=SQLRefresh+' and (Data0060.PROD_REL=2) and (Data0060.ISSUED_QTY=0) ';
    GetData;
  end;
end;

procedure TfrmMain.AddParamsColumn;
var
  i,StartField,ColCount,j:integer;
begin
  if DM.aq60.Active =false then exit;
  DM.qryTmp.Close;
  DM.qryTmp.SQL.Clear;
  DM.qryTmp.SQL.Add(' select t278.PARAMETER_NAME,t278.PARAMETER_DESC from SpellCondition t0 inner join Data0278 t278 on t0.Param_PTR=t278.RKEY '+
                    ' order by seqNo ');
  DM.qryTmp.open;
  ColCount:=DBGridEh1.Columns.Count;
  j:=0;
  StartField:=1000;
  with DM do
  begin
    for i:=0 to aq60.Fields.Count-1 do
    begin
      if i < StartField then
      begin
        if aq60.Fields[i].FieldName = 'Flag' then //从Flag字段开始之后，都需要动态加载到DBGRidEH中
          StartField:=i;
      end
      else
      begin
        DBGridEh1.Columns.Add;
        if qryTmp.Locate('PARAMETER_NAME',aq60.Fields[i].FieldName,[]) then
        begin
          DBGridEh1.Columns[ColCount+j].FieldName := aq60.Fields[i].FieldName;
          DBGridEh1.Columns[ColCount+j].Title.Alignment := taCenter;
          DBGridEh1.Columns[ColCount+j].Width := 100;
          DBGridEh1.Columns[ColCount+j].Title.Caption:= qryTmp.fieldbyName('PARAMETER_DESC').AsString;
{          DBGridEh2.Columns.Add;
          DBGridEh2.Columns[ColCount+j].FieldName := aq60.Fields[i].FieldName;
          DBGridEh2.Columns[ColCount+j].Title.Alignment := taCenter;
          DBGridEh2.Columns[ColCount+j].Width := 100;
          DBGridEh2.Columns[ColCount+j].Title.Caption:= qryTmp.fieldbyName('PARAMETER_DESC').AsString;}
        end;
        Inc(j);
      end;
    end;
  end;
  TransferColumnToGrid2;
end;

procedure TfrmMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if DM.aq60.FieldByName('Flag').AsBoolean then
  begin
    DBGrideh1.Canvas.Font.Color :=clred;
  end;
  if DM.aq60.FieldByName('SpellTogether').AsInteger = 2 then
  begin
    DBGrideh1.Canvas.Font.Color :=clgreen;
  end;
//    DBGrideh1.Canvas.Font.Color := clgreen;
  DBGrideh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
//  if
  N1.Enabled:=( not DM.aq60.IsEmpty) and ((DM.aq60.FieldByName('SpellTogether').AsInteger =-1) or (DM.aq60.FieldByName('SpellTogether').AsInteger =0)) ;
  N2.Enabled:=(DM.aq60.FieldByName('SpellTogether').AsInteger =0) and (DM.aq60.FieldByName('Flag').AsBoolean) ;//and (DM.aq60.FieldByName('spellto_employeename').AsString= EMPName);
  N3.Enabled:=(DM.aq60.FieldByName('SpellTogether').AsInteger =2)  and (DM.aq60.FieldByName('spellto_employeename').AsString= EMPName);
  N4.Enabled:=(DM.aq60.FieldByName('SpellTogether').AsInteger =2) and (DM.aq60.FieldByName('spellto_employeename').AsString= EMPName);
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  i:integer;
 item:TMenuItem;
begin
  form_condition.dtpk2.Date:=getsystem_date(DM.qryTmp,1);
  form_condition.dtpk1.Date:=form_condition.dtpk2.Date-1;
  for i := 1 to dbGridEH1.Columns.Count do
  begin
    item := TmenuItem.Create(self);
    item.Caption := dbGridEH1.Columns[i - 1].Title.Caption;
    item.Checked :=dbGridEH1.Columns[i - 1].Visible ;
    item.OnClick := item_click ;
    PMFlds.Items.Add(item) ;
  end;
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  ExecSql(DM.qryTmp,'Update data0060 set SpellTogether=-1 where rkey='+dm.aq60.fieldbyName('rkey60').asstring);
  DM.aq60.Delete;
//  BitBtn3Click(Sender);
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  ExecSql(DM.qryTmp,'Update data0060 set SpellTogether=2,spellto_employeename='+QuotedStr(EMPName)+' where rkey='+dm.aq60.fieldbyName('rkey60').asstring);
  dm.aq60.edit;
  dm.aq60.fieldbyName('SpellTogether').Value:=2;
  dm.aq60.fieldbyName('JointStatusCN').Value:='合拼中';
  dm.aq60.fieldbyName('spellto_employeename').Value:=EMPName;
  dm.aq60.Post;
end;

procedure TfrmMain.N4Click(Sender: TObject);
var
  rkey60:integer;
  CanAdd:Boolean;
//  Tmp_EMPName:string;
begin
  with DM do
  begin
    if aq60.IsEmpty then Exit;
    if not aqOrderChosen.IsEmpty then
    begin
      if Application.MessageBox('已选择待合拼订单，确定要清空已选内容吗？', '提示', MB_OKCANCEL + MB_ICONWARNING) = IDOK then
        DeleteData(aqOrderChosen)
      else
        Abort;
    end;
    aqParamList.Close;
    aqParamList.Open;
    aq60.DisableControls;
    aqOrderChosen.DisableControls;
    try
      rkey60:=aq60.fieldbyName('rkey60').AsInteger;
//      ShowMessage('aqOrderChosen='+aqOrderChosen.Fields[0].FieldName);
//      Tmp_EMPName:=aq60.fieldbyName('spellto_employeename').asstring;
      CopyRecord(aq60,aqOrderChosen);//复制选中的订单到待合拼订单列表
      aq60.Delete; //删除选中的合拼记录
      aq60.Filter:='SpellTogether=2 and spellto_employeename='+QuotedStr(EMPName);
      aq60.Filtered:=true;
      aq60.First;
      //循环订单，判断订单合拼条件相同的记录，加入到合拼列表中
      while not aq60.Eof do
      begin
        CanAdd:=true; //初始值
        aqOrderChosen.Locate('rkey60',rkey60,[]);
        aqParamList.First; //循环合拼参数列表
        while not aqParamList.Eof do
        begin
          if aq60.FieldByName(aqParamList.fieldbyName('PARAMETER_NAME').AsString).AsString <>
             aqOrderChosen.FieldByName(aqParamList.fieldbyName('PARAMETER_NAME').AsString).AsString then
          begin
            CanAdd:=false;
            break;
          end;
          aqParamList.Next;
        end;
        if CanAdd then //满足合拼条件，可以加入
        begin
          CopyRecord(aq60,aqOrderChosen);//复制选中的订单到待合拼订单列表
          aq60.Delete; //删除选中的合拼记录
        end
        else
          aq60.Next;
      end;
    finally
      aq60.Filtered:=false;
      aq60.EnableControls;
      aqOrderChosen.EnableControls;
    end
  end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  ExecSql(DM.qryTmp,'Update data0060 set SpellTogether=0,spellto_employeename=null where rkey='+dm.aq60.fieldbyName('rkey60').asstring);
  dm.aq60.edit;
  dm.aq60.fieldbyName('SpellTogether').Value:=0;
  dm.aq60.fieldbyName('JointStatusCN').Value:='未合拼';
  dm.aq60.fieldbyName('spellto_employeename').Value:=Null;
  dm.aq60.Post;
end;

procedure TfrmMain.Panel2Resize(Sender: TObject);
begin
  btnOK.Left:=(Panel2.Width-btnOk.Width) div 2;
end;

procedure TfrmMain.btnOKClick(Sender: TObject);
var rkey25,rkey60:integer;
Qty,LMin:double;
begin
  if not (StrToInt(vprev) in [2,4]) then
  begin
    ShowMessage('无权限');
    Abort;
  end;
  if DM.aqOrderChosen.IsEmpty then Exit;
  if DM.aqOrderChosen.RecordCount=1 then
  begin
    ShowMessage('一个订单无法合拼!');
    Exit;
  end;
  frmQnty:= TfrmQnty.Create(nil);
  try
    with frmQnty do
    begin
      with DM do
      begin
        aqOrderChosen.DisableControls;
        rkey60:=aqOrderChosen.FieldByName('rkey60').AsInteger;
        aqOrderChosen.Sort:= 'rkey25,rkey60';
        aqOrderChosen.First;
        rkey25:=0;
        Qty:=0;
        while not aqOrderChosen.Eof do
        begin
          cdsUpdate.Append;
          cdsUpdate.FieldByName('RKEY25').Value:= aqOrderChosen.FieldByName('rkey25').AsInteger;
          cdsUpdate.FieldByName('RKEY60').Value:=aqOrderChosen.FieldByName('rkey60').AsInteger ;
          cdsUpdate.FieldByName('MANU_PART_NUMBER').Value:=aqOrderChosen.FieldByName('MANU_PART_NUMBER').AsString;
          cdsUpdate.Post;

          if rkey25 <> aqOrderChosen.FieldByName('rkey25').AsInteger then
          begin
            cdsOrder.Append;
            cdsOrder.FieldByName('RKEY25').Value:= aqOrderChosen.FieldByName('rkey25').AsInteger;
            cdsOrder.FieldByName('RKEY60').Value:=aqOrderChosen.FieldByName('rkey60').AsInteger;
            cdsOrder.FieldByName('MANU_PART_NUMBER').Value:=aqOrderChosen.FieldByName('MANU_PART_NUMBER').AsString;
            cdsOrder.FieldByName('PARTS_ORDERED').Value:=aqOrderChosen.FieldByName('PARTS_ORDERED').Value;
            cdsOrder.FieldByName('spell_qty').Value:=aqOrderChosen.FieldByName('spell_qty').Value;
            cdsOrder.FieldByName('ANALYSIS_CODE_1').Value:=aqOrderChosen.FieldByName('ANALYSIS_CODE_1').Value;
            if cdsOrder.FieldByName('PARTS_ORDERED').AsInteger mod cdsOrder.FieldByName('spell_qty').AsInteger <> 0 then
              cdsOrder.FieldByName('Rate').Value:= cdsOrder.FieldByName('PARTS_ORDERED').AsInteger div cdsOrder.FieldByName('spell_qty').AsInteger + 1
            else
              cdsOrder.FieldByName('Rate').Value:= cdsOrder.FieldByName('PARTS_ORDERED').AsInteger div cdsOrder.FieldByName('spell_qty').AsInteger;
          end
          else
          begin
            cdsOrder.FieldByName('PARTS_ORDERED').Value:=cdsOrder.FieldByName('PARTS_ORDERED').Value+aqOrderChosen.FieldByName('PARTS_ORDERED').Value;
            if cdsOrder.FieldByName('PARTS_ORDERED').AsInteger mod cdsOrder.FieldByName('spell_qty').AsInteger <> 0 then
              cdsOrder.FieldByName('Rate').Value:= cdsOrder.FieldByName('PARTS_ORDERED').AsInteger div cdsOrder.FieldByName('spell_qty').AsInteger + 1
            else
              cdsOrder.FieldByName('Rate').Value:= cdsOrder.FieldByName('PARTS_ORDERED').AsInteger div cdsOrder.FieldByName('spell_qty').AsInteger;
          end;
          rkey25:= aqOrderChosen.FieldByName('rkey25').AsInteger;
          aqOrderChosen.Next;
        end;
        cdsOrder.First;
        LMin:= cdsOrder.FieldByName('Rate').Value;
        while not cdsOrder.Eof do
        begin
          cdsOrder.Edit;
          cdsOrder.FieldByName('Rate').Value :=common.ExRoundTo(cdsOrder.FieldByName('Rate').Value / LMin,1);
          cdsOrder.Post;
          cdsOrder.Next;
        end;
        cdsOrder.First;

        DBGridEh1.SelectedIndex:=4;
        if cdsOrder.RecordCount =1 then
        begin
          ShowMsg('同一个产品不能合拼',1);
          exit;
        end;
      end;
    end;
    frmQnty.ShowModal;
    dm.aqOrderChosen.Sort:='rkey60';
    dm.aqOrderChosen.locate('rkey60',rkey60,[]);
    if Trim(frmQnty.edtProdNo.Text)<>'' then //合拼生成新料号
      BitBtn3Click(nil);
  finally
    frmQnty.free;
    dm.aqOrderChosen.EnableControls;
  end;
end;

procedure TfrmMain.DBGridEh1DblClick(Sender: TObject);
begin
  if (DM.aq60.FieldByName('SpellTogether').AsInteger =2) and (DM.aq60.FieldByName('spellto_employeename').AsString= EMPName) then
    N4Click(Sender);
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
  if DM.aq60.IsEmpty then exit;
  Export_dbGridEH_to_Excel(DBGridEh1,'产品合拼订单信息')
end;

procedure TfrmMain.BtFldsClick(Sender: TObject);
begin
PMFlds.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmMain.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to dbGridEH1.FieldCount - 1 do
    if dbGridEH1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbGridEH1.Columns[i].Visible := true;
      break;
    end;
  end else begin
    for i := 0 to dbGridEH1.FieldCount - 1 do
    if dbGridEH1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbGridEH1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure TfrmMain.TransferColumnToGrid2;
var
  i:integer;
begin
  DBGridEh2.Columns.Clear;
  for i := 0 to DBGridEh1.Columns.Count -1 do
  begin
    DBGridEh2.Columns.Add;
    DBGridEh2.Columns[i].FieldName := DBGridEh1.Columns[i].FieldName;
    DBGridEh2.Columns[i].Title.Alignment := taCenter;
    DBGridEh2.Columns[i].Width := DBGridEh1.Columns[i].Width;
    DBGridEh2.Columns[i].Visible:=DBGridEh1.Columns[i].Visible;
    DBGridEh2.Columns[i].Title.Caption:= DBGridEh1.Columns[i].Title.Caption;
  end;
end;

procedure TfrmMain.DBGridEh2DblClick(Sender: TObject);
begin
  if DM.aqOrderChosen.IsEmpty then exit;
    DM.aqOrderChosen.Delete;
end;

procedure TfrmMain.edtKeyChange(Sender: TObject);
var tmpstr,sFilter:string;
begin
  if not DM.aq60.Active then abort;
  tmpstr:= trim(edtKey.Text);
 if tmpstr<>'' then
 begin
  DM.aq60.Filter := field_name+' like ''%'+tmpstr+'%''';
  DM.aq60.Filtered:= True;
 end
 else
  DM.aq60.Filtered:= false
{
  if TmpStr='' then
    DM.aq60.Filtered:= false
  else
  begin
    if (vColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '%'+uppercase(TmpStr)+'%';
      DM.aq60.Filter := vColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      DM.aq60.Filtered:= true;
    end
    else if vColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      if TmpStr='-' then exit;
      sFilter := vColumn.Field.FieldName+'>='+TmpStr;
      DM.aq60.Filter := sFilter;
      DM.aq60.Filtered:= true;
    end
    else if vColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      if not IsDatetime(TmpStr) then exit;
      sFilter := '>='+QuotedStr(TmpStr);
      DM.aq60.Filter := vColumn.Field.FieldName + sFilter;
      DM.aq60.Filtered:= true;
    end;
  end;}
end;

procedure TfrmMain.edtKeyKeyPress(Sender: TObject; var Key: Char);
begin
 { if vColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end
  else if  vColumn.Field.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end ;}
end;

procedure TfrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
  //Dm.aq60.IndexFieldNames:=column.FieldName;

  if (column.ReadOnly) and (field_name<>column.FieldName) then
  begin
    labelKey.Caption:=column.Title.Caption;
    self.field_name:=column.FieldName;
    edtKey.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
    edtKey.SetFocus;
end;

end.
