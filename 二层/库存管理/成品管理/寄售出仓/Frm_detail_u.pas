unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    Panel2: TPanel;
    SGrid: TStringGrid;
    N2: TMenuItem;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edt_cust: TEdit;
    DateTimePicker1: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    DateTimePicker2: TDateTimePicker;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label10: TLabel;
    BtnSave: TBitBtn;
    CMBCurr: TComboBox;
    Label11: TLabel;
    N1: TMenuItem;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edt_custExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure CMBCurrChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure GetSort(var GenStrGrid : TStringGrid; ThatCol : Integer);
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FCurr:array[0..5] of integer;
  public
    Ftag:integer;
    FGrd:TDBGridEh;
    procedure initd;
  end;

implementation
  uses DM_u,common,Pick_Item_Single,ConstVar,Frm_detailEdt_u,Frm_Out_u,Math;

{$R *.dfm}
procedure TFrm_detail.GetSort(var GenStrGrid : TStringGrid; ThatCol : Integer);
const
 TheSeparator = '@'; // Define the Separator
var
 CountItem, I, J, K, ThePosition : Integer;
 MyList : TStringList;
 MyString, TempString : String;
begin
 CountItem := GenStrGrid.RowCount; // Give the number of rows in the StringGrid
  for i:=0 to CountItem-2 do
  begin
    GenStrGrid.Cells[ThatCol,i] := StringofChar('0',3-Length(GenStrGrid.Cells[ThatCol,i]))+GenStrGrid.Cells[ThatCol,i];
  end;
 MyList := TStringList.Create; //Create the List
 MyList.Sorted := False;
 try
  begin
   for I := 1 to (CountItem - 2) do
    MyList.Add(GenStrGrid.Rows[I].Strings[ThatCol] + TheSeparator + GenStrGrid.Rows[I].Text);
   Mylist.Sort;//Sort the List
   for K := 1 to Mylist.Count do
    begin
     MyString := MyList.Strings[(K - 1)];//Take the String of the line (K ? 1)
     ThePosition := Pos(TheSeparator, MyString);//Find the position of the Separator in the String
     TempString := '';
     {Eliminate the Text of the column on which we have sorted the StringGrid}
     TempString := Copy(MyString, (ThePosition + 1), Length(MyString));
     MyList.Strings[(K - 1)] := '';
     MyList.Strings[(K - 1)] := TempString;
    end;
   for J := 1 to (CountItem - 2) do
    GenStrGrid.Rows[J].Text := MyList.Strings[(J - 1)];//Refill the StringGrid
  end;
 finally
  MyList.Free;//Free the List
 end; 
  CountItem := GenStrGrid.RowCount; // Give the number of rows in the StringGrid
  for i:=0 to CountItem-2 do
  begin
    GenStrGrid.Cells[ThatCol,i] := inttostr(strtoint(GenStrGrid.Cells[ThatCol,i]));
  end;
end;

procedure TFrm_detail.initd;
var i,j:integer;
begin
  SGrid.ColCount:=FGrd.Columns.Count+1;
  SGrid.RowCount:=2;
  for i:=0 to SGrid.ColCount-2 do
  begin
    SGrid.Cells[i,0]:=FGrd.Columns[i].Title.Caption;
    SGrid.ColWidths[i]:=FGrd.Columns[i].Width;
  end;

  SGrid.Cells[SGrid.ColCount-1,0]:='rkey153';
  SGrid.ColWidths[i]:=-1;

  DM.tmp.Close;
  DM.tmp.SQL.Text:='select top 6 rkey,curr_code+'' ''+curr_name from data0001';
  DM.tmp.Open;
  i:=0;
  while not DM.tmp.Eof do
  begin
    FCurr[i]:=DM.tmp.Fields[0].AsInteger;
    CMBCurr.Items.Append(DM.tmp.Fields[1].asstring);
    inc(i);
    DM.tmp.Next;
  end; 

  if Ftag=0 then
  begin
    self.Caption:='寄售出仓-新增';
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select getdate()';
    DM.tmp.Open;
    DateTimePicker1.DateTime:=DM.tmp.Fields[0].AsDateTime;
    DateTimePicker2.DateTime:=DM.tmp.Fields[0].AsDateTime;

    DM.AQ157_1.Close;
    DM.AQ157_1.Parameters[0].Value:=-1;
    DM.AQ157_1.Open;
    DM.AQ158_1.Close;
    DM.AQ158_1.Parameters[0].Value:=-1;
    DM.AQ158_1.Open;
  end else begin
    self.Caption:='寄售出仓-修改';
    Edt_cust.Enabled:=false;
    SpeedButton1.Enabled:=false;
    CMBCurr.Tag:=DM.AQ157CURRENCY_PTR.AsInteger;
    for i:=0 to 5 do
      if FCurr[i]=CMBCurr.Tag then begin CMBCurr.ItemIndex:=i;break;end;

    DM.AQ157_1.Close;
    DM.AQ157_1.Parameters[0].Value:=DM.AQ157rkey.Value;
    DM.AQ157_1.Open;

    DM.AQ158.Close;
    DM.AQ158.Open;

    DM.AQ158_1.Close;
    DM.AQ158_1.Parameters[0].Value:=DM.AQ157rkey.Value;
    DM.AQ158_1.Open;

    Edit1.Text:=DM.AQ157PRINT_NUMBER.AsString;
    DateTimePicker1.DateTime:=DM.AQ157ENT_DATE.AsDateTime;
    Edt_cust.Text:=DM.AQ157CUST_CODE.AsString;
    Edt_cust.tag:=DM.AQ157CUSTOMER_PTR.AsInteger;
    Label10.Caption:=Dm.AQ157ABBR_NAME.AsString;
    DateTimePicker2.DateTime:=DM.AQ157BRING_DATE.AsDateTime;

    Edit3.Text:=DM.AQ157personnel_name.AsString;
    Edit4.Text:=DM.AQ157receipt_number.AsString;
    Edit5.Text:=DM.AQ157REMARK.AsString;
    Edit6.Text:=DM.AQ157QUANTITY.AsString;
    Edit7.Text:=DM.AQ157AMOUNT.AsString;
    j:=1;
    while not DM.AQ158.Eof do
    begin
      for i:=0 to SGrid.ColCount-2 do
      begin
//        if (FGrd.Columns[i] as TDBGridColumnEh).FieldName = 'PRICE' then
//          SGrid.Cells[i,j]:=FGrd.Columns[i].Field.AsString
//        else
          SGrid.Cells[i,j]:=FGrd.Columns[i].Field.AsString;
      end;
      SGrid.Cells[SGrid.ColCount-1,j]:=DM.AQ158STOCK_PTR.AsString;//153rkey
      SGrid.RowCount:=SGrid.RowCount+1;
      inc(j);
      DM.AQ158.Next;
    end;
  end;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var i:integer;
begin
  if SGrid.RowCount=2 then
  begin
    showmessage('不能保存空记录...');
    exit;
  end;
  if edit1.Text='' then
  begin
    showmessage('打印单号不能为空...');
    exit;
  end;
  if Ftag=0 then   //add
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Clear;
    DM.tmp.SQL.Add('select * from data0157 where PRINT_NUMBER = '''+Edit1.Text+'''');
    DM.tmp.Open;
    if DM.tmp.RecordCount<>0 then
    begin
      showmessage('打印单号不能重复...');
      Abort;
    end;
    DM.AQ157_1.Append;
    DM.AQ157_1.FieldByName('PRINT_NUMBER').AsString:=Edit1.Text;
    DM.AQ157_1.FieldByName('EMPL_PTR').AsString:=user_ptr;
    DM.AQ157_1.FieldByName('ENT_DATE').AsDateTime:=DateTimePicker1.DateTime;
    DM.AQ157_1.FieldByName('personnel_name').AsString:=Edit3.Text;
    DM.AQ157_1.FieldByName('BRING_DATE').AsDateTime:=DateTimePicker2.Date;
    DM.AQ157_1.FieldByName('QUANTITY').AsString:=Edit6.Text;
    DM.AQ157_1.FieldByName('AMOUNT').AsString:=Edit7.Text;
    DM.AQ157_1.FieldByName('REMARK').AsString:=Edit5.Text;
    DM.AQ157_1.FieldByName('receipt_number').AsString:=Edit4.Text;
    DM.AQ157_1.FieldByName('CUSTOMER_PTR').AsInteger:=Edt_cust.Tag;
    DM.AQ157_1.FieldByName('CURRENCY_PTR').AsInteger:=CMBCurr.Tag;
    DM.AQ157_1.Post;

    DM.ADOCon.BeginTrans;
    try
      DM.AQ157_1.UpdateBatch(arAll);
      DM.AQ158_1.First;
      while not DM.AQ158_1.Eof do
      begin
        DM.AQ158_1.Edit;
        DM.AQ158_1.FieldByName('PRINT_PTR').AsInteger:=DM.AQ157_1.FieldByName('rkey').AsInteger;
        DM.AQ158_1.Post;
        DM.AQ158_1.Next;
      end;
      DM.AQ158_1.UpdateBatch(arAll);
      //showmessage(DM.AQ158_1.Fieldbyname('price').asstring);
      DM.tmp.Close;
      DM.tmp.SQL.Text:='update data0153 set Qty_on_hand=Qty_on_hand-d158.OUT_QTY from '+
                       'data0153 d153 inner join data0158 d158 on d153.rkey=d158.STOCK_PTR '+
                       'where d158.PRINT_PTR='+DM.AQ157_1.FieldByName('rkey').AsString+
                       ' and d153.Qty_on_hand>=d158.OUT_QTY';
      if DM.tmp.ExecSQL<>DM.AQ158_1.RecordCount then
      begin
        DM.ADOCon.RollbackTrans;
        showmessage('保存数据时,当前可用库存不足,保存失败...');
        exit;
      end;
      DM.ADOCon.CommitTrans;
      Frkey157:=DM.AQ157_1.FieldByName('rkey').asinteger;
      modalresult:=mrok;      
    except
      DM.ADOCon.RollbackTrans;
      showmessage('保存数据失败...');
    end;
  end else begin  //edit
    DM.AQ157_1.Edit;
    DM.AQ157_1.FieldByName('EMPL_PTR').AsString:=user_ptr;
    DM.AQ157_1.FieldByName('ENT_DATE').AsDateTime:=DateTimePicker1.DateTime;
    DM.AQ157_1.FieldByName('personnel_name').AsString:=Edit3.Text;
    DM.AQ157_1.FieldByName('BRING_DATE').AsDateTime:=DateTimePicker2.Date;
    DM.AQ157_1.FieldByName('QUANTITY').AsString:=Edit6.Text;
    DM.AQ157_1.FieldByName('AMOUNT').AsString:=Edit7.Text;
    DM.AQ157_1.FieldByName('REMARK').AsString:=Edit5.Text;
    DM.AQ157_1.FieldByName('receipt_number').AsString:=Edit4.Text;
    DM.AQ157_1.FieldByName('CURRENCY_PTR').AsInteger:=CMBCurr.Tag;
    DM.AQ157_1.Post;

    DM.AQ158_1.First;
    while not DM.AQ158_1.Eof do
    begin
      DM.AQ158_1.Edit;
      DM.AQ158_1.FieldByName('PRINT_PTR').AsInteger:=DM.AQ157_1.FieldByName('rkey').AsInteger;
      DM.AQ158_1.Post;
      DM.AQ158_1.Next;
    end;

    DM.ADOCon.BeginTrans;
    try
      DM.AQ158.First;
      while not DM.AQ158.Eof do
      begin
        DM.tmp.Close;
        DM.tmp.SQL.Text:='update data0153 set QTY_ON_HAND=QTY_ON_HAND+'+DM.AQ158OUT_QTY.AsString +
                         ' where rkey='+DM.AQ158STOCK_PTR.AsString; //原领料先退仓
        DM.tmp.ExecSQL;
        DM.AQ158.Next;
      end;

      DM.AQ157_1.UpdateBatch(arAll);
      DM.AQ158_1.UpdateBatch(arAll);
      DM.tmp.Close;
      DM.tmp.SQL.Text:='update data0153 set Qty_on_hand=Qty_on_hand-d158.OUT_QTY from '+
                       'data0153 d153 inner join data0158 d158 on d153.rkey=d158.STOCK_PTR '+
                       'where d158.PRINT_PTR='+DM.AQ157_1.FieldByName('rkey').AsString+
                       ' and d153.Qty_on_hand>=d158.OUT_QTY';
      if DM.tmp.ExecSQL<>DM.AQ158_1.RecordCount then
      begin
        DM.ADOCon.RollbackTrans;
        showmessage('保存数据时,当前可用库存不足,保存失败...');
        exit;
      end;
      DM.ADOCon.CommitTrans;
      Frkey157:=DM.AQ157_1.FieldByName('rkey').asinteger;
      modalresult:=mrok;
    except
    //  on exeption 
      DM.ADOCon.RollbackTrans;
      showmessage('保存数据失败...');
    end;

  end;
end;

procedure TFrm_detail.N5Click(Sender: TObject);
var  iCUSTOMER_PTR,i:integer;
     Qty_sum,Amount_sum:real ;
begin
  if Edt_cust.Text='' then
  begin
    showmessage('请先输入客户代码...');
    exit;
  end;
 // self.Hide;
  TFrm_detailEdt.InitEdt(Edt_cust.Tag,sGrid);
  Qty_sum:=0;
  Amount_sum:=0;
  for i:=1 to SGrid.RowCount-2 do
  begin
    Qty_sum:=Qty_sum+strtofloat(SGrid.Cells[3,i]);
    Amount_sum:=Amount_sum+strtofloat(SGrid.Cells[3,i])*strtofloat(SGrid.Cells[4,i]);
  end;
  Edit6.Text:=floattostr(Qty_sum);
  Edit7.Text:=floattostr(Amount_sum);
 // self.Visible:=true;

  Edt_cust.Enabled:=(Ftag=0) and (DM.AQ158_1.RecordCount=0);
  SpeedButton1.Enabled:=Edt_cust.Enabled;
end;

procedure TFrm_detail.N2Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid.RowCount <= 2 then exit;
  if DM.AQ158_1.Locate('STOCK_PTR',strtoint(sGrid.Cells[SGrid.ColCount-1,sgrid.Row]),[]) then
  begin
    DM.AQ158_1.Delete;
    Edit6.Text:=floattostr(strtofloat(Edit6.Text)-strtofloat(SGrid.Cells[3,sgrid.Row]));
    Edit7.Text:=floattostr(strtofloat(Edit7.Text)-strtofloat(SGrid.Cells[3,sgrid.Row])*strtofloat(SGrid.Cells[4,sgrid.Row]));
    for i:=sgrid.Row to sgrid.RowCount-2 do sgrid.Rows[i].Text:=sgrid.Rows[i+1].Text;
    sgrid.RowCount:=sgrid.RowCount-1;

    Edt_cust.Enabled:=(Ftag=0) and (DM.AQ158_1.RecordCount=0);
    SpeedButton1.Enabled:=Edt_cust.Enabled;
  end;
end;

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
  var InputVar: PDlgInput ;
      i:integer;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'CUST_CODE/客户编码/200,ABBR_NAME/客户名称/200';
    InputVar.Sqlstr :='select rkey,CUST_CODE,ABBR_NAME,CURRENCY_PTR from data0010 where DO_SMOOTHING=1 order by CUST_CODE';
    inputvar.KeyField:='CUST_CODE';

    InputVar.AdoConn := DM.ADOCon ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edt_cust.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
      label10.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME']);
      Edt_cust.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      CMBCurr.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('CURRENCY_PTR').AsInteger;
      for i:=0 to 5 do
        if FCurr[i]=CMBCurr.Tag then begin CMBCurr.ItemIndex:=i;break;end;
    end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_detail.Edt_custExit(Sender: TObject);
var i:integer;
begin
   if (Edt_cust.Text='') or (Ftag=1) then exit;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select rkey,CUST_CODE,ABBR_NAME,CURRENCY_PTR from data0010 where CUST_CODE='''+Edt_cust.Text+''' and DO_SMOOTHING=1';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('客户代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label10.Caption := '';
     Edt_cust.SetFocus;
   end else begin
     Edt_cust.Text:=DM.tmp.FieldValues['CUST_CODE'];
     label10.Caption:=DM.tmp.FieldValues['ABBR_NAME'];
     Edt_cust.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
     CMBCurr.Tag:=DM.tmp.Fieldbyname('CURRENCY_PTR').AsInteger;
     for i:=0 to 5 do
       if FCurr[i]=CMBCurr.Tag then begin CMBCurr.ItemIndex:=i;break;end;
   end;
end;

procedure TFrm_detail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.PopupMenu1Popup(Sender: TObject);
begin
  N2.Enabled:=not ((SGrid.Row=0) or (SGrid.Row=SGrid.RowCount-1));
  N1.Enabled:=N2.Enabled;
end;

procedure TFrm_detail.CMBCurrChange(Sender: TObject);
begin
  CMBCurr.Tag:=FCurr[CMBCurr.ItemIndex];
end;

procedure TFrm_detail.N1Click(Sender: TObject);
var Qty_sum,Amount_sum:real;
i:integer;
begin
  with TFrm_out.Create(nil) do
  try
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select data0153.*,data0025.MANU_PART_NUMBER,data0025.MANU_PART_DESC,data0025.analysis_code_2,Convert(Float,data0153.PRICE) as Price6 from '+
                    'data0153 inner join data0025 on '+
                    'data0153.CUSTPART_PTR=data0025.rkey '+
                    'where data0153.rkey='+SGrid.Cells[10,sgrid.Row];
    DM.tmp.Open;

    Edit1.Text:=DM.tmp.Fieldbyname('MANU_PART_DESC').AsString;
    Edit2.Text:=DM.tmp.Fieldbyname('MANU_PART_NUMBER').AsString;

    if (Ftag=1) and DM.AQ158.Locate('STOCK_PTR',strtoint(sGrid.Cells[SGrid.ColCount-1,sgrid.Row]),[]) then
      Edit4.Text:=inttostr(DM.tmp.Fieldbyname('QTY_ON_HAND').AsInteger+strtoint(SGrid.Cells[3,sgrid.Row]))
    else
      Edit4.Text:=DM.tmp.Fieldbyname('QTY_ON_HAND').AsString;

    Edit5.Text:=SGrid.Cells[3,sgrid.Row];
    Edit7.Text:=SGrid.Cells[4,sgrid.Row];

    Edit3.Text:=SGrid.Cells[8,sgrid.Row];
    Edit6.Text:=SGrid.Cells[9,sgrid.Row];

    if showmodal=mrok then
    begin
      if DM.AQ158_1.Locate('STOCK_PTR',strtoint(sGrid.Cells[SGrid.ColCount-1,sgrid.Row]),[]) then
      begin
        DM.AQ158_1.edit;
        DM.AQ158_1.FieldByName('OUT_QTY').AsString:=Edit5.Text;
        DM.AQ158_1.FieldByName('PRICE').AsString:=Edit7.Text;
        DM.AQ158_1.FieldByName('RECE_NUMBER').AsString:=Edit3.Text;
        DM.AQ158_1.FieldByName('REMARK').AsString:=Edit6.Text;
        DM.AQ158_1.Post;
        SGrid.Cells[3,sgrid.Row]:=Edit5.Text; //数量
        SGrid.Cells[4,sgrid.Row]:=Edit7.Text; //单价
        SGrid.Cells[8,sgrid.Row]:=Edit3.Text; //收料号
        SGrid.Cells[9,sgrid.Row]:=Edit6.Text; //备注
        Qty_sum:=0;
        Amount_sum:=0;
        for i:=1 to SGrid.RowCount-2 do
        begin
          Qty_sum:=Qty_sum+strtofloat(SGrid.Cells[3,i]);
          Amount_sum:=Amount_sum+strtofloat(SGrid.Cells[3,i])*strtofloat('0'+SGrid.Cells[4,i]);
        end;
        self.Edit6.Text:=floattostr(Qty_sum);
        self.Edit7.Text:=floattostr(Amount_sum);
      end;
    end;
  finally
    free;
  end;

end;

procedure TFrm_detail.StringGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
        SGrid.MouseToCell(x,y,column,row);
   if row<>0 then SGrid.Row:=row;
 end
else
 if Button=mbLeft then
  begin
   SGrid.MouseToCell(x,y,column,row);
   if (Row=0) and (column in [0,1,2,5,6]) then
   begin
    GetSort(SGrid,column);  
   end;
  end;
end;

end.
