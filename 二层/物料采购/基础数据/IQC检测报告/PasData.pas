unit PasData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine, Chart, Series,
  DB, ADODB, Menus, ExtDlgs, ComCtrls, Grids, DBGridEh;

type
  TfrmData = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TBitBtn;
    qry1: TADOQuery;
    ds1: TDataSource;
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    pnl1: TPanel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    btn6: TSpeedButton;
    edt1: TEdit;
    ud1: TUpDown;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    chtR: TChart;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl1: TLabel;
    Label1: TLabel;
    edtCode: TEdit;
    btncode: TBitBtn;
    ehrate: TDBGridEh;
    btnExport: TBitBtn;
    Series1: TLineSeries;
    procedure FormShow(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure btncodeClick(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;

  public
    { Public declarations }
    LCode:string;
    LINVT,LMod,LGroupID:Integer;
    LSDate,LEDate:TDateTime;
  end;

var
  frmData: TfrmData;

implementation

uses DAMO,DateUtils,Pick_Item_Single,ConstVar, PasSelect,common;

{$R *.dfm}

procedure TfrmData.Init;
var
  LSelect,LSelect_2,LSelect_3,LWhere,LGroupWhere:string;
  LGroup,LGroup_2,months,Lorder:string;
  i,LFieldCount:Integer;
//  LSeries: TBarSeries;
begin
  try
    Series1.Clear;
    if LMod = 1 then
    begin
      LSelect_3:= ',datepart(yy,auth_date)*100+datepart(mm,auth_date) as 月份' ;
      LGroup_2:= ',datepart(yy,auth_date)*100+datepart(mm,auth_date)' ;
      LSelect_2:= ' ,sum(case when data0391.status = 2 then 1  else 0 end) as 合格数, sum(case when (data0391.status=2) or (data0391.status=3) then 1 else 0 end) as 总数 ';
    end
    else
    begin
      LSelect_3:='';
      LGroup_2:='';
      LSelect_2:= ' ,sum(case when data0391.status = 2 then 1  else 0 end) as 合格数, sum(case when (data0391.status=2) or (data0391.status=3) then 1 else 0 end) as 总数 ';
    end;
    if LGroupID <>0 then LGroupWhere := ' and Data0017.group_ptr = ' + IntToStr(LGroupID)
    else LGroupWhere:='';

    if (LCode='') and (LINVT=0)then
    begin
      LSelect:= 'SELECT data0023.abbr_name as 供应商简称,data0023.code as 供应商代码 '+  LSelect_2 +
          ' ,ROUND(sum(case when data0391.status = 2 then 1  else 0 end)*1.0  '  +
          '  / sum(case when (data0391.status=2) or (data0391.status=3) then 1 end),4) * 100 AS [合格率%] ' + LSelect_3 + #13+
          ' FROM data0391 inner join   ' + #13+
          '          data0071 on data0391.rkey71=data0071.rkey inner join ' + #13+
          '          data0070 on data0070.rkey=data0071.po_ptr inner join ' + #13+
          '          data0023 on data0070.SUPPLIER_POINTER=data0023.rkey  inner join ' + #13+
          '          data0017 on data0017.rkey = data0391.rkey17 ';
      LWhere:= ' where data0391.status <>1 and auth_date between ' + QuotedStr(DateToStr(LSDate)) + ' and ' + QuotedStr(DateToStr(IncDay(LEDate))) + LGroupWhere;
      LGroup:= ' group by data0023.code,data0023.abbr_name' + LGroup_2;
      Lorder:= ' ORDER BY DATA0023.CODE' + LGroup_2;
    end
    else if (LCode='') and (LINVT<>0) then
    begin
      LSelect:= 'SELECT data0017.INV_PART_NUMBER as 材料编码,data0017.INV_NAME as 材料名称 '+   LSelect_2 +
          ' ,ROUND(sum(case when data0391.status = 2 then 1 else 0 end)*1.0  ' +
          '  / sum(case when (data0391.status=2) or (data0391.status=3) then 1 else 0 end),4) * 100 AS [合格率%] ' + LSelect_3 + #13+
          ' FROM data0391 inner join   ' + #13+
          '          data0071 on data0391.rkey71=data0071.rkey inner join ' + #13+
          '          data0070 on data0070.rkey=data0071.po_ptr inner join ' + #13+
          '          data0017 on data0391.rkey17 = data0017.rkey ';
      LWhere:= ' where data0391.status <>1 and auth_date between ' + QuotedStr(DateToStr(LSDate)) + ' and ' + QuotedStr(DateToStr(IncDay(LEDate))) + #13 +
               ' and data0391.rkey17 = ' + IntToStr(LINVT)  + LGroupWhere;
      LGroup:= ' group by data0017.INV_PART_NUMBER,data0017.INV_NAME' + LGroup_2;
      Lorder:= ' ORDER BY data0017.INV_PART_NUMBER' + LGroup_2;
    end
    else if (LCode<>'') and (LINVT<>0) then
    begin
          LSelect:= 'SELECT data0023.abbr_name as 供应商简称,data0017.INV_PART_NUMBER as 材料编码 '+      LSelect_2 +
          ' ,ROUND(sum(case when data0391.status = 2 then 1  else 0 end)*1.0  ' +
          '  / sum(case when (data0391.status=2) or (data0391.status=3) then 1 else 0 end),4) * 100 AS [合格率%] ' + LSelect_3 + #13+
          ' FROM data0391 inner join   ' + #13+
          '          data0071 on data0391.rkey71=data0071.rkey inner join ' + #13+
          '          data0070 on data0070.rkey=data0071.po_ptr inner join ' + #13+
          '          data0023 on data0070.SUPPLIER_POINTER=data0023.rkey inner join ' + #13+
          '          data0017 on data0391.rkey17=data0017.rkey ';
          LWhere:= ' where data0391.status <>1 and auth_date between ' + QuotedStr(DateToStr(LSDate)) + ' and ' + QuotedStr(DateToStr(IncDay(LEDate))) + #13 +
                   ' and data0070.SUPPLIER_POINTER in (' + LCode + ')' + #13+
                   ' and data0391.rkey17=' + IntToStr(LINVT)   + LGroupWhere;
          LGroup:= ' group by data0023.abbr_name,data0017.INV_PART_NUMBER' + LGroup_2;
          Lorder:= ' ORDER BY DATA0023.CODE' + LGroup_2;
    end
    else if (LCode<>'') and (LINVT=0) then
    begin
          LSelect:= 'SELECT data0023.abbr_name as 供应商简称,data0023.code as 供应商代码   '+    LSelect_2 +
          ' ,ROUND(sum(case when data0391.status = 2 then 1  else 0 end)*1.0  ' +
          '  / sum(case when (data0391.status=2) or (data0391.status=3) then 1 else 0 end),4) * 100 AS [合格率%] ' +  LSelect_3 + #13+
          ' FROM data0391 inner join   ' + #13+
          '          data0071 on data0391.rkey71=data0071.rkey inner join ' + #13+
          '          data0070 on data0070.rkey=data0071.po_ptr inner join ' + #13+
          '          data0023 on data0070.SUPPLIER_POINTER = data0023.rkey inner join ' + #13+
          '          data0017 on data0017.rkey = data0391.rkey17 ';
          LWhere:= ' where data0391.status <>1 and auth_date between ' + QuotedStr(DateToStr(LSDate)) + ' and ' + QuotedStr(DateToStr(IncDay(LEDate))) + #13 +
                   ' and data0070.SUPPLIER_POINTER in (' + LCode + ')'   + LGroupWhere;
          LGroup:= ' group by data0023.abbr_name,data0023.code' + LGroup_2;
          Lorder:= ' ORDER BY DATA0023.CODE' + LGroup_2;
    end;

//    if LMod =1 then
//    with DM.adoTmp do
//    begin
//      close;
//      SQL.Text:='declare @sql varchar(200) '+ #13+
//                'SELECT @sql= ISNULL( @sql + '','','''') + QUOTENAME(datepart(yy,auth_date)*100+datepart(mm,auth_date)) FROM data0391 '+ #13+
//            ' WHERE auth_date between ' + QuotedStr(DateToStr(LSDate)) + ' and ' + QuotedStr(DateToStr(IncDay(LEDate))) + #13+
//            ' GROUP BY datepart(yy,auth_date)*100+datepart(mm,auth_date)' +#13+
//            ' SELECT @sql ';
////      ShowMessage(SQL.Text);
//      open;
//      if not IsEmpty then
//        months:= Fields[0].asstring
//      else
//        months:= '[-1]';
//    end;

    with qry1 do
    begin
      Close;
      SQL.Text:= LSelect+ #13 + LWhere+#13 + LGroup + Lorder;
//      if LMod = 1 then SQL.Text:= 'SELECT * from ( ' +  SQL.Text + ' ) p PIVOT(SUM([合格率%]) FOR 月份 IN ('+ months + ' )) as pvt ' ;
//      ShowMessage(SQL.Text);
      Open;
      if not IsEmpty then
      begin
        qry1.DisableControls;
        while not Eof do
        begin
          if LMod = 1 then  Series1.Add(Fields[4].Value,Fields[5].AsString)
          else  Series1.Add(Fields[4].Value,Fields[0].AsString);
           Next;
        end;
        qry1.EnableControls;
        Series1.marks.Style:= smsValue;
        Series1.ValueFormat:='#,##0.00';
//        Series1.Title:= qry1.Fields[i+1].FieldName;
//        chtR.AddSeries(Series1);

//        LFieldCount:= FieldCount - 2;
        for i:=0 to qry1.FieldCount -1 do
        begin
          ehrate.Columns[i].Width:= 100;
        end;
//
//        for i:=1 to LFieldCount do
//        begin
//          LSeries:= TBarSeries.Create(chtR);
//          First;
//          while not Eof do
//          begin
//              if LMod =  1 then
////                if Fields[2].IsNull then LSeries.Add(0,Fields[0].AsString)
////                else
//                LSeries.Add(Fields[i+1].AsFloat,Fields[0].AsString)
//              else
//                LSeries.Add(Fields[4].Value,Fields[0].AsString);
//             Next;
//          end;
//          LSeries.marks.Style:= smsValue;
//          LSeries.ValueFormat:='#,##0.00';
//          LSeries.Title:= qry1.Fields[i+1].FieldName;
//          chtR.AddSeries(LSeries);
//        end;
      end;
    end;
    chtr.Legend.Visible:=False;
    chtR.LeftAxis.Title.Caption:='合格率';
    frmData.chtR.Title.Text.Text:= '汇总分析';
    qry1.First;
  finally

  end;
end;

procedure TfrmData.FormShow(Sender: TObject);
begin
  Self.Init;
end;

procedure TfrmData.btn5Click(Sender: TObject);
begin
 IF chtR.View3DOptions.Zoom<100 THEN
    chtR.View3DOptions.Zoom := chtR.View3DOptions.Zoom + 5;
end;

procedure TfrmData.btn6Click(Sender: TObject);
begin
  IF chtR.View3DOptions.Zoom>1 THEN
    chtR.View3DOptions.Zoom := chtR.View3DOptions.Zoom - 5;
end;

procedure TfrmData.btn4Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
   chtR.SaveToBitmapFile(SavePictureDialog1.FileName+'.bmp');
end;

procedure TfrmData.btn3Click(Sender: TObject);
begin
  if PrintDialog1.Execute then chtR.Print;
end;

procedure TfrmData.btn1Click(Sender: TObject);
begin
  chtR.PreviousPage;
end;

procedure TfrmData.btn2Click(Sender: TObject);
begin
  chtR.NextPage;
end;

procedure TfrmData.edt1Change(Sender: TObject);
begin
  chtR.MaxPointsPerPage:=ud1.Position;
end;

procedure TfrmData.btncodeClick(Sender: TObject);
var
  Lfrm:TfrmSelect;
  KeyList:string;
  i:Integer;
begin
  Lfrm:= TfrmSelect.Create(Self);
  try
    Lfrm.SelectType:=1;
    if Lfrm.ShowModal=mryes then
    begin
      edtCode.Text:='';
      KeyList:='';
      with Lfrm.adoSelect do
      begin
        First;
        while not Eof do
        begin
          edtCode.Text:=FieldByName('供应商代码').asstring + ','+ edtCode.Text ;
          KeyList:= FieldByName('rkey').asstring + ','+ KeyList;
//          keyList.Add(FieldByName('').asstring + '=' + FieldByName('rkey').AsString);
          Next;
        end;
      end;
      edtCode.Text:=Copy(edtCode.Text,0,Length(edtCode.Text)-1);
      KeyList:= Copy(KeyList,0,Length(KeyList)-1);
      LCode:=KeyList;
//      for i:=0 to chtR.SeriesCount -1 do
//        chtR.Series[0].Free;
      Self.Init;
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmData.dtp1Change(Sender: TObject);
var
  i:Integer;
begin
  LSDate:= dtp1.Date;
  LEDate:= dtp2.Date;
//  for i:=0 to chtR.SeriesCount -1 do
//    chtR.Series[0].Free;
  Self.Init;
end;

procedure TfrmData.btnExportClick(Sender: TObject);
begin
  if  not qry1.IsEmpty then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(ehrate,'合格率');
end;

end.
