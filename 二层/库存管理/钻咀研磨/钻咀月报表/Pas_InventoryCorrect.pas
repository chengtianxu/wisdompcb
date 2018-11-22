unit Pas_InventoryCorrect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids,ADODB,dateutils,math, ComCtrls;

type
  TFrm_InventoryCorrect = class(TForm)
    Panel1: TPanel;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    SG1: TStringGrid;
    dtpBegin: TDateTimePicker;
    Label1: TLabel;
    dtpEnd: TDateTimePicker;
    Label2: TLabel;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn5Click(Sender: TObject);
    procedure SG1KeyPress(Sender: TObject; var Key: Char);
  private
    i0017_prt:Integer;
    s230Rkey:string;
    procedure ShowADOQueryDataOnStringGrid(AdoConn: TADOConnection;SG: TStringGrid);
    procedure SetHeightAndWidthOnStringGrid(sg: TStringGrid; Height,width: Integer);
    procedure Show0224TOSG(SG: TStringGrid; s223Rkey: string='';iRow: Integer=0);
    procedure update_04(v_seed: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_InventoryCorrect: TFrm_InventoryCorrect;

implementation

uses common,DM, Pas_Main;

{$R *.dfm}
procedure TFrm_InventoryCorrect.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 TDM.ado04.Close;
 TDM.ado04.Open;
 if TDM.ado04SEED_FLAG.Value<>1 then
 begin
   v_length := length(v_seed);
   for i := v_length downto 1 do
    if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
    begin
      v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
      new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
      TDM.ado04.Edit; //使前缀不变后缀加1
      TDM.ado04SEED_VALUE.Value := new_seed;
      TDM.ado04.Post;
      break;
    end
    else
   if i=1 then //如果第一位仍然是数字
   begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     TDM.ado04.Edit;
     TDM.ado04SEED_VALUE.Value := new_seed;
     TDM.ado04.Post;
   end;
 end;
end;

//显示0224到StringGrid期初值
procedure TFrm_InventoryCorrect.Show0224TOSG(SG:TStringGrid;s223Rkey:string='';iRow:Integer=0);
var i,iLen,iLen2,iLen3:Integer;
    sNo:string;
begin
  TDM.Adods224.Close;
  TDM.Adods224.Parameters.ParamByName('d223').Value:=s223Rkey;
  TDM.Adods224.Open;
  if (TDM.Adods224.RecordCount>0) then
  begin
    for i:=1 to SG.RowCount-1 do
    begin
      iLen:=Length(SG.Cells[0,i]);
      iLen2:=Pos('(',SG.Cells[0,i]);
      iLen3:=Pos(')',SG.Cells[0,i]);
      sNo:=Copy(SG.Cells[0,i],iLen2+1,iLen3-iLen2-1);
      TDM.Adods224.First;
      while not TDM.Adods224.Eof do
      begin
        if (sNo=TDM.Adods224.FieldByName('d0160_Prt').AsString) then
        begin
          SG.Cells[iRow,i]:=TDM.Adods224.FieldByName('StockDrill').AsString;
          TDM.Adods224.Next;
        end else TDM.Adods224.Next;
      end;
    end;
  end;
end;

procedure TFrm_InventoryCorrect.SetHeightAndWidthOnStringGrid(sg: TStringGrid; Height,width: Integer);
var i,j:Integer;
begin
  for i := 0 to SG.RowCount-1 do
  begin
    sg.RowHeights[i]:=Height;
  end;
  for j:=0 to SG.ColCount-1 do
  begin
    sg.ColWidths[j]:=width;
  end;

end;
//把ADOQuery的数据显示在StringGrid上.
procedure  TFrm_InventoryCorrect.ShowADOQueryDataOnStringGrid(AdoConn: TADOConnection;SG: TStringGrid);
var iRecordCount, iFieldCount,i: Integer;
    tmpAdo,tmpAdo2:TADOQuery;
begin
  try
    try
      SG.ColCount:=2;
      SG.RowCount:=2;
      SG.Rows[1].Clear;
      SG.Update;
      SG.ColCount:=3;
      sg.FixedCols:=2;
      SG.Cells[0,0]:='位置';
      SG.Cells[1,0]:='原有库存数量';
      SG.Cells[2,0]:='更正库存数量';
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=AdoConn;
      tmpAdo2:=TADOQuery.Create(Application);
      tmpAdo2.Connection:=AdoConn;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Add('select LOCATION_NAME,LOCATION_CODE from data0160 where type<>3 order by LOCATION_CODE');
      tmpAdo.Open;
      i:=0;
      while not tmpAdo.Eof do
      begin
        SG.Cells[0,i+1]:=tmpAdo.FieldByName('LOCATION_NAME').AsString+'('+tmpAdo.FieldByName('LOCATION_CODE').AsString+')';
        SG.RowCount:=SG.RowCount+1;
        i:=i+1;
        tmpAdo.Next;
      end;
    except
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;
    SG.RowCount:=SG.RowCount-1;
    SetHeightAndWidthOnStringGrid(SG1,28,125);
    sg.ColWidths[0]:=120;
    SG.Update;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

procedure TFrm_InventoryCorrect.BitBtn6Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_InventoryCorrect.FormShow(Sender: TObject);
var i:Integer;
    dBeginAfterMonths,dEndAfterMonths:TDateTime;
    tmpAdo:TADOQuery;
begin
  i0017_prt:=0;
  s230Rkey:='';
  dtpBegin.Date:=TDM.Ado0223dBeginDate.AsDateTime; //第一天
  dtpEnd.Date:=TDM.Ado0223dEndDate.AsDateTime; //月最后一天
  dBeginAfterMonths:=IncMonth(dtpBegin.Date,1);
  dEndAfterMonths:=EndOfTheMonth(dBeginAfterMonths);
  ShowADOQueryDataOnStringGrid(TDM.ADOConn,SG1);  //显示SG
  Try
    tmpAdo:=TADOQuery.Create(Self);
    tmpAdo.Connection:=TDM.ADOConn;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0223 where dBeginDate=:dM and dEndDate=:dM2');
    tmpAdo.Parameters.ParamByName('dM').Value:=FormatDateTime('yyyy-mm-dd',dBeginAfterMonths);
    tmpAdo.Parameters.ParamByName('dM2').Value:=FormatDateTime('yyyy-mm-dd',dEndAfterMonths);
    tmpAdo.Open;
    if (tmpAdo.RecordCount>0) then //
    begin
      i0017_prt:=tmpAdo.FieldByName('Data0017_prt').Value;
      s230Rkey:=tmpAdo.FieldByName('Rkey').Value;
      Show0224TOSG(SG1,s230Rkey,1); //期初
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

procedure TFrm_InventoryCorrect.SG1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  {文字居中}
  with Sender as TStringGrid do
  begin
    Canvas.FillRect(Rect);
    DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), Length(Cells[ACol, ARow]), Rect, DT_CENTER or DT_SINGLELINE or DT_VCENTER);
  end;
  {文字居中结束}
end;

procedure TFrm_InventoryCorrect.BitBtn5Click(Sender: TObject);
var i,iSum,iRkey:Integer;
    tmpAdo,tmpAdo2,tmpAdo3:TADOQuery;
    iLen,iLen2,iLen3:Integer;
    sNo:String;
    dAfterMonths:TDateTime;
begin
  if (i0017_prt=0) and (s230Rkey='') then
  begin
    ShowMsg('没有更正信息',1);
    Exit;
  end;
  if (Application.MessageBox('盘点更正将会删除上个月全部记录，是否继续？', '操作提示', MB_OKCANCEL + MB_ICONINFORMATION) = IDCANCEL) then Exit;
  iSum:=0;
  iRkey:=0;
  try
    tmpAdo:=TADOQuery.Create(Self);
    tmpAdo.Connection:=TDM.ADOConn;
    tmpAdo2:=TADOQuery.Create(Self);
    tmpAdo2.Connection:=TDM.ADOConn;
    tmpAdo3:=TADOQuery.Create(Self);
    tmpAdo3.Connection:=TDM.ADOConn;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0219 where CREATE_DATE>=:dM and CREATE_DATE<=:dM2');
    tmpAdo.Parameters.ParamByName('dM').Value:=FormatDateTime('yyyy-mm-dd',dtpBegin.Date);
    tmpAdo.Parameters.ParamByName('dM2').Value:=FormatDateTime('yyyy-mm-dd',dtpEnd.Date);
    tmpAdo.Open;
    if (tmpAdo.RecordCount>0) then
    begin
      SG1.Cursor:=crHourGlass;
      tmpAdo.First;
      while not tmpAdo.Eof do
      begin
        tmpAdo2.Close;
        tmpAdo2.SQL.Clear;
        tmpAdo2.SQL.Add('select * from dbo.data0220 where GRN_PTR='+tmpAdo.FieldBYName('Rkey').AsString);
        tmpAdo2.Open;
        if (tmpAdo2.RecordCount>0) then
        begin
          tmpAdo2.First;
          while not tmpAdo2.Eof do
          begin
            tmpAdo3.Close;
            tmpAdo3.SQL.Clear;
            tmpAdo3.SQL.Add('delete dbo.data0270 where bach_fromptr='+tmpAdo2.FieldByName('Rkey').AsString);
            tmpAdo3.ExecSQL;
            tmpAdo3.Close;
            tmpAdo3.SQL.Clear;
            tmpAdo3.SQL.Add('delete dbo.data0270 where bach_endptr='+tmpAdo2.FieldByName('Rkey').AsString);
            tmpAdo3.ExecSQL;
            //报废
            tmpAdo3.Close;
            tmpAdo3.SQL.Clear;
            tmpAdo3.SQL.Add('select * from dbo.data0222 where bach_ptr='+tmpAdo2.FieldByName('Rkey').AsString);
            tmpAdo3.Open;
            if (tmpAdo3.RecordCount>0) then iRkey:=tmpAdo3.FieldByName('head_ptr').AsInteger else iRkey:=-1;
            if (iRkey<>-1) then
            begin
              tmpAdo3.Close;
              tmpAdo3.SQL.Clear;
              tmpAdo3.SQL.text:='delete dbo.data0222 where head_ptr='+InttoStr(iRkey);
              tmpAdo3.ExecSQL;
              tmpAdo3.Close;
              tmpAdo3.SQL.Clear;
              tmpAdo3.SQL.Add('delete dbo.data0221 where Rkey='+InttoStr(iRkey));
              tmpAdo3.ExecSQL;
            end;
            tmpAdo2.Next;
          end;
        end;
        tmpAdo2.Close;
        tmpAdo2.SQL.Clear;
        tmpAdo2.SQL.Add('delete dbo.data0220 where GRN_PTR='+tmpAdo.FieldBYName('Rkey').AsString);
        tmpAdo2.ExecSQL;
        tmpAdo2.Close;
        tmpAdo2.SQL.Clear;
        tmpAdo2.SQL.Add('delete dbo.data0219 where Rkey='+tmpAdo.FieldBYName('Rkey').AsString);
        tmpAdo2.ExecSQL;
        tmpAdo.Next;
      end;
    end;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0221 where sys_date>=:dM and sys_date<=:dM2');
    tmpAdo.Parameters.ParamByName('dM').Value:=FormatDateTime('yyyy-mm-dd',dtpBegin.Date);
    tmpAdo.Parameters.ParamByName('dM2').Value:=FormatDateTime('yyyy-mm-dd',dtpEnd.Date);
    tmpAdo.Open;
    if (tmpAdo.RecordCount>0) then
    begin
      tmpAdo.First;
      while not tmpAdo.Eof do
      begin
        tmpAdo3.Close;
        tmpAdo3.SQL.Clear;
        tmpAdo3.SQL.Add('delete dbo.data0222 where head_ptr='+tmpAdo.FieldByName('Rkey').AsString);
        tmpAdo3.ExecSQL;
        tmpAdo3.Close;
        tmpAdo3.SQL.Clear;
        tmpAdo3.SQL.Add('delete dbo.data0221 where Rkey='+tmpAdo.FieldByName('Rkey').AsString);
        tmpAdo3.ExecSQL;
        tmpAdo.Next;
      end;
    end;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0224 where d0223_PTR=:d0223_PTR');
    tmpAdo.Parameters.ParamByName('d0223_PTR').Value:=s230Rkey;
    tmpAdo.Open;
    if (tmpAdo.RecordCount>0) then
    begin
      for i :=1  to SG1.RowCount-1 do
      begin
        iLen:=Length(SG1.Cells[0,i]);
        iLen2:=Pos('(',SG1.Cells[0,i]);
        iLen3:=Pos(')',SG1.Cells[0,i]);
        sNo:=Copy(SG1.Cells[0,i],iLen2+1,iLen3-iLen2-1);
        tmpAdo.First;
        while not tmpAdo.Eof do
        begin
          if (sNo=tmpAdo.FieldByName('d0160_Prt').AsString) then
          begin
            if (Trim(SG1.Cells[2,i])='') then SG1.Cells[2,i]:='0';
            iSum:=iSum+StrToInt(SG1.Cells[2,i]);
            tmpAdo2.Close;
            tmpAdo2.SQL.Clear;
            tmpAdo2.SQL.Add('update dbo.data0224 set StockDrill='+SG1.Cells[2,i]+' where d0223_PTR='+s230Rkey+' and d0160_Prt='''+sNo+'''');
            tmpAdo2.ExecSQL;
            tmpAdo.Next;
          end else tmpAdo.Next;
        end;
      end;
      tmpAdo2.Close;
      tmpAdo2.SQL.Clear;
      tmpAdo2.SQL.Add('update dbo.data0224 set StockDrill='+IntToStr(iSum)+' where d0223_PTR='+s230Rkey+' and d0160_Prt=''合计''');
      tmpAdo2.ExecSQL;
      tmpAdo2.Close;
      tmpAdo2.SQL.Clear;
      tmpAdo2.SQL.Add('update dbo.data0223 set StockDrill='+IntToStr(iSum)+' where Rkey='+s230Rkey+'');
      tmpAdo2.ExecSQL;
    end;
    TDM.ado04.Open;
    if TDM.ado04SEED_FLAG.Value<>1 then
     Label2.Caption:=TDM.ado04SEED_VALUE.Value;
    TDM.ado04.Close;
    dAfterMonths:=IncMonth(dtpBegin.Date,1);
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0219 where REMARK='''+FormatDateTime('yyyy-mm-dd',dAfterMonths)+'''');
    tmpAdo.Open;
    if (tmpAdo.RecordCount>0) then
    begin
      tmpAdo2.Close;
      tmpAdo2.SQL.Clear;
      tmpAdo2.SQL.Add('delete dbo.data0220 where GRN_PTR='+tmpAdo.fieldByName('Rkey').AsString);
      tmpAdo2.ExecSQL;
      tmpAdo2.Close;
      tmpAdo2.SQL.Clear;
      tmpAdo2.SQL.Add('delete dbo.data0219 where REMARK='''+FormatDateTime('yyyy-mm-dd',dAfterMonths)+'''');
      tmpAdo2.ExecSQL;
    end;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Text:='insert into dbo.data0219 (GRN_NUMBER,CREATE_DATE,SYSTEM_DATE,TTYPE,CREATE_BY,REMARK) values (:GRN_NUMBER,:CREATE_DATE,:SYSTEM_DATE,:TTYPE,:CREATE_BY,:REMARK)';
    tmpAdo.Parameters.ParamByName('GRN_NUMBER').Value:=Label2.Caption;
    tmpAdo.Parameters.ParamByName('CREATE_DATE').Value:=FormatDateTime('yyyy-mm-dd',dAfterMonths);
    tmpAdo.Parameters.ParamByName('SYSTEM_DATE').Value:=FormatDateTime('yyyy-mm-dd',Now);
    tmpAdo.Parameters.ParamByName('TTYPE').Value:='0';
    tmpAdo.Parameters.ParamByName('CREATE_BY').Value:=user_ptr;
    tmpAdo.Parameters.ParamByName('REMARK').Value:=FormatDateTime('yyyy-mm-dd',dAfterMonths);
    tmpAdo.ExecSQL;
    update_04(Label2.Caption);
    tmpAdo2.Close;
    tmpAdo2.SQL.Clear;
    tmpAdo2.SQL.Add('select * from dbo.data0219 order by Rkey desc');
    tmpAdo2.Open;
    for i :=1  to SG1.RowCount-2 do
    begin
      iLen:=Length(SG1.Cells[0,i]);
      iLen2:=Pos('(',SG1.Cells[0,i]);
      iLen3:=Pos(')',SG1.Cells[0,i]);
      sNo:=Copy(SG1.Cells[0,i],iLen2+1,iLen3-iLen2-1);
      tmpAdo3.Close;
      tmpAdo3.SQL.Clear;
      tmpAdo3.SQL.Add('select * from dbo.data0160 where LOCATION_CODE='''+sNo+'''');
      tmpAdo3.Open;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='insert into dbo.data0220 (GRN_PTR,INVENTORY_PTR,SUPPLIER_PTR,LOCATION_PTR,OH_degree,QUANTITY,QUAN_ON_HAND)'
      +' values (:GRN_PTR,:INVENTORY_PTR,:SUPPLIER_PTR,:LOCATION_PTR,:OH_degree,:QUANTITY,:QUAN_ON_HAND)';
      tmpAdo.Parameters.ParamByName('GRN_PTR').Value:=tmpAdo2.FieldBYName('Rkey').AsInteger;
      tmpAdo.Parameters.ParamByName('INVENTORY_PTR').Value:=TDM.Ado0223Data0017_prt.Value;
      tmpAdo.Parameters.ParamByName('SUPPLIER_PTR').Value:='1228';
      tmpAdo.Parameters.ParamByName('LOCATION_PTR').Value:=tmpAdo3.FieldBYName('RKEY').AsInteger;
      tmpAdo.Parameters.ParamByName('OH_degree').Value:=tmpAdo3.fieldBYName('OH_degree').AsInteger;
      tmpAdo.Parameters.ParamByName('QUANTITY').Value:=SG1.Cells[2,i];
      tmpAdo.Parameters.ParamByName('QUAN_ON_HAND').Value:=SG1.Cells[2,i];
      tmpAdo.ExecSQL;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
    tmpAdo2.Close;
    tmpAdo2.Connection:=nil;
    tmpAdo2.Free;
    tmpAdo3.Close;
    tmpAdo3.Connection:=nil;
    tmpAdo3.Free;
  end;
  SG1.Cursor:=crDefault;
  modalresult:=mrok;
end;

procedure TFrm_InventoryCorrect.SG1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then
    key := #0;
end;

end.
