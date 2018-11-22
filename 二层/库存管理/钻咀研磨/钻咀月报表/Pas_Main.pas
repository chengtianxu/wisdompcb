unit Pas_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, ComCtrls,ADODB,dateutils;

type
  TFrm_Main = class(TForm)
    Panel1: TPanel;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    SG1: TStringGrid;
    BitBtn3: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    iRowNo:Integer;//机台列表行表号
    i0017_prt:Integer;
    procedure Show0224TOSG(SG: TStringGrid;s223Rkey:string='';iRow:Integer=0);
    procedure show220ToSG(SG: TStringGrid; AdoConn: TADOConnection;const sSQL, TTYpe,dBegin,dEndDate: string; iRow:Integer=0;iCol:Integer=0);
    procedure show220ToSG2(SG:TStringGrid;AdoConn: TADOConnection;const sSQL,TTYpe,dBegin,dEndDate:string;iRow:Integer=0;iCol:Integer=0);
    procedure Show0222TOSG2(SG: TStringGrid;AdoConn: TADOConnection;const sSQL,dBegin,dEndDate:string;iRow: Integer=0);
    procedure SumSG(SG: TStringGrid);
    procedure CountSG;
    procedure ShowNewStorageTOSG(SG: TStringGrid; const dBegin,dEndDate: string; iRow: Integer=0);
    procedure ShowRecordTOSG;
    procedure ShowRecordTOSG2;
    procedure ShowNewStorageTOSG2(SG: TStringGrid; const dBegin,dEndDate: string; iRow: Integer=0);
    { Private declarations }
  public
    { Public declarations }
    //设置stringGrid
    procedure SetHeightAndWidthOnStringGrid(sg:TStringGrid;Height:integer=30;width:Integer=80);
    //表记录数
     function GetRecordNumber(AdoConn: TADOConnection; const TableName: string; swhere: string):Integer;
     procedure DeleteRecord(const TableName, Values: string; AdoConn: TADOConnection; LinkTable, LinkField, FindField, whereT, Deleteother: string);
    procedure ClearStringGrid(SG: TStringGrid);
    procedure ShowADOQueryDataOnStringGrid(AdoConn: TADOConnection;SG: TStringGrid);
  end;

var
  Frm_Main: TFrm_Main;

implementation
uses common,DM, Pas_InventoryCorrect;//, PasJiTai;
{$R *.dfm}
procedure TFrm_Main.ShowRecordTOSG2;
var strSQL:string;
begin

end;
procedure TFrm_Main.ShowRecordTOSG;
var strSQL:string;
    i,k:Integer;
begin
//------end 新增期末值--------------------------------------------------------------------
        //发放机台
        strSQL:='select dbo.data0220.OH_degree,dbo.data0160.Location_code,dbo.data0160.Location_Name,'
        +'dbo.data0160.type,dbo.data0220.inventory_ptr,sum(dbo.data0220.Quantity) as iSum'
        +' from dbo.data0220 left join dbo.data0160 on dbo.data0160.Rkey=dbo.data0220.Location_Ptr'
        +' inner JOIN dbo.data0219 on dbo.data0220.GRN_Ptr=dbo.data0219.Rkey'
        +' where exists(select distinct OH_degree from dbo.data0220) and dbo.data0219.TType=:TType'
        +' and dbo.data0219.CREATE_DATE>=:dBeinDate and dbo.data0219.CREATE_DATE<=:dEndDate'
        +' group by dbo.data0160.Location_code,dbo.data0160.Location_Name,dbo.data0160.type,dbo.data0220.inventory_ptr,dbo.data0220.OH_degree';
        show220ToSG(SG1,TDM.ADOConn,strSQL,'1',FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),10,3);
        //机台回收
        strSQL:='select dbo.data0220.OH_degree,dbo.data0160.Location_code,dbo.data0160.Location_Name,'
        +'dbo.data0160.type,dbo.data0220.inventory_ptr,sum(dbo.data0220.Quantity) as iSum'
        +' from dbo.data0220 left join dbo.data0160 on dbo.data0160.Rkey=dbo.data0220.Location_Ptr'
        +' inner JOIN dbo.data0219 on dbo.data0220.GRN_Ptr=dbo.data0219.Rkey'
        +' where exists(select distinct OH_degree from dbo.data0220) and dbo.data0219.TType=:TType'
        +' and dbo.data0219.CREATE_DATE>=:dBeinDate and dbo.data0219.CREATE_DATE<=:dEndDate'
        +' group by dbo.data0160.Location_code,dbo.data0160.Location_Name,dbo.data0160.type,dbo.data0220.inventory_ptr,dbo.data0220.OH_degree';
        show220ToSG(SG1,TDM.ADOConn,strSQL,'2',FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),3,4);
        //发送研磨房
        strSQL:='select dbo.data0220.OH_degree,dbo.data0160.Location_code,dbo.data0160.Location_Name,'
        +'dbo.data0160.type,dbo.data0220.inventory_ptr,sum(dbo.data0220.Quantity) as iSum'
        +' from dbo.data0220 left join dbo.data0160 on dbo.data0160.Rkey=dbo.data0220.Location_Ptr'
        +' inner JOIN dbo.data0219 on dbo.data0220.GRN_Ptr=dbo.data0219.Rkey'
        +' where exists(select distinct OH_degree from dbo.data0220) and dbo.data0219.TType=:TType'
        +' and dbo.data0219.CREATE_DATE>=:dBeinDate and dbo.data0219.CREATE_DATE<=:dEndDate'
        +' group by dbo.data0160.Location_code,dbo.data0160.Location_Name,dbo.data0160.type,dbo.data0220.inventory_ptr,dbo.data0220.OH_degree';
        show220ToSG2(SG1,TDM.ADOConn,strSQL,'3',FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),3,5);
        //研磨房回收
        strSQL:='select dbo.data0220.OH_degree,dbo.data0160.Location_code,dbo.data0160.Location_Name,'
        +'dbo.data0160.type,dbo.data0220.inventory_ptr,sum(dbo.data0220.Quantity) as iSum'
        +' from dbo.data0220 left join dbo.data0160 on dbo.data0160.Rkey=dbo.data0220.Location_Ptr'
        +' inner JOIN dbo.data0219 on dbo.data0220.GRN_Ptr=dbo.data0219.Rkey'
        +' where exists(select distinct OH_degree from dbo.data0220) and dbo.data0219.TType=:TType'
        +' and dbo.data0219.CREATE_DATE>=:dBeinDate and dbo.data0219.CREATE_DATE<=:dEndDate'
        +' group by dbo.data0160.Location_code,dbo.data0160.Location_Name,dbo.data0160.type,dbo.data0220.inventory_ptr,dbo.data0220.OH_degree';
        show220ToSG2(SG1,TDM.ADOConn,strSQL,'4',FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),10,6);
        //报废
        strSQL:='select dbo.data0160.Location_code,dbo.data0160.Location_Name,'
        +' dbo.data0160.type,dbo.data0220.inventory_ptr,sum(dbo.data0222.Quantity) as iSum '
        +' from dbo.data0220 left join dbo.data0160 on dbo.data0160.Rkey=dbo.data0220.Location_Ptr'
        +' inner join dbo.data0222 on dbo.data0220.Rkey=dbo.data0222.bach_ptr'
        +' inner join dbo.data0221 on dbo.data0222.head_ptr=dbo.data0221.Rkey'
        +' where exists(select distinct Location_ptr from dbo.data0220) and dbo.data0221.status=2'
        +' and dbo.data0221.sys_date>=:dBeinDate and dbo.data0221.sys_date<=:dEndDate'
        +' group by dbo.data0160.Location_code,dbo.data0160.Location_Name,dbo.data0160.type,dbo.data0220.inventory_ptr';
        Show0222TOSG2(SG1,TDM.ADOConn,strSQL,FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),7);
        //机台报废另外计算
        TDM.ADOQuery1.Close;
        TDM.ADOQuery1.SQL.Clear;
        TDM.ADOQuery1.SQL.Text:='SELECT dbo.DATA0220.OH_degree,sum(dbo.DATA0222.quantity) as quantity'
                               +'  FROM dbo.DATA0222 INNER JOIN'
                               +'        dbo.DATA0220 ON dbo.DATA0222.bach_ptr = dbo.DATA0220.RKEY INNER JOIN'
                               +'        dbo.Data0017 ON dbo.DATA0220.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'
                               +'        dbo.DATA0160 ON dbo.DATA0220.LOCATION_PTR = dbo.DATA0160.RKEY inner join'
                               +'        dbo.data0221 on dbo.data0222.head_ptr=dbo.data0221.Rkey'
                               +'   where dbo.data0221.status=2 and dbo.data0221.sys_date>=:date1 and dbo.data0221.sys_date<=:date2 and dbo.data0160.TYPE=3'
                               +'   group by dbo.DATA0220.OH_degree';
        TDM.ADOQuery1.Parameters.ParamByName('date1').Value:=FormatDateTime('yyyy-mm-dd',dtpBegin.Date);
        TDM.ADOQuery1.Parameters.ParamByName('date2').Value:=FormatDateTime('yyyy-mm-dd',dtpEnd.Date);
        TDM.ADOQuery1.Open;
        if not TDM.ADOQuery1.IsEmpty then
        begin
          TDM.ADOQuery1.First;
          i:=10;
          k:=0;
          while not TDM.ADOQuery1.Eof do
          begin
            if (SG1.Cells[7,i]='') then SG1.Cells[7,i]:='0';
            if (TDM.ADOQuery1.FieldByName('OH_degree').AsInteger=5) then k:=i;
            if TDM.ADOQuery1.FieldByName('OH_degree').AsInteger=6 then SG1.Cells[7,k]:=IntToStr(StrToInt(SG1.Cells[7,k])+tdm.ADOQuery1.fieldBYName('quantity').AsInteger) else
            SG1.Cells[7,i]:=IntToStr(StrToInt(SG1.Cells[7,i])+tdm.ADOQuery1.fieldBYName('quantity').AsInteger);
            i:=i+1;
            TDM.ADOQuery1.Next;
          end;
        end;

        //显示合计数
        SumSG(SG1);
        //期末库存
        CountSG;
        //差异数
        SG1.Cells[8,2]:=IntToStr(StrToInt(SG1.Cells[9,2])-(StrToInt(SG1.Cells[1,2])+StrToInt(SG1.Cells[2,2])
        -StrToInt(SG1.Cells[3,2])-StrToInt(SG1.Cells[7,2]))); //新钻
        SG1.Cells[8,3]:=IntToStr(StrToInt(SG1.Cells[9,3])-(StrToInt(SG1.Cells[1,3])+StrToInt(SG1.Cells[2,3])
        +StrToInt(SG1.Cells[4,3])-StrToInt(SG1.Cells[5,3])-StrToInt(SG1.Cells[7,3])));//待磨0
        SG1.Cells[8,4]:=IntToStr(StrToInt(SG1.Cells[9,4])-(StrToInt(SG1.Cells[1,4])+StrToInt(SG1.Cells[2,4])
        +StrToInt(SG1.Cells[4,4])-StrToInt(SG1.Cells[5,4])-StrToInt(SG1.Cells[7,4])));//待磨1
        SG1.Cells[8,5]:=IntToStr(StrToInt(SG1.Cells[9,5])-(StrToInt(SG1.Cells[1,5])+StrToInt(SG1.Cells[2,5])
        +StrToInt(SG1.Cells[4,5])-StrToInt(SG1.Cells[5,5])-StrToInt(SG1.Cells[7,5])));//待磨2
        SG1.Cells[8,6]:=IntToStr(StrToInt(SG1.Cells[9,6])-(StrToInt(SG1.Cells[1,6])+StrToInt(SG1.Cells[2,6])
        +StrToInt(SG1.Cells[4,6])-StrToInt(SG1.Cells[5,6])-StrToInt(SG1.Cells[7,6])));//待磨3
        SG1.Cells[8,7]:=IntToStr(StrToInt(SG1.Cells[9,7])-(StrToInt(SG1.Cells[1,7])+StrToInt(SG1.Cells[2,7])
        +StrToInt(SG1.Cells[4,7])-StrToInt(SG1.Cells[5,7])-StrToInt(SG1.Cells[7,7])));//待磨4
        SG1.Cells[8,8]:=IntToStr(StrToInt(SG1.Cells[9,8])-(StrToInt(SG1.Cells[1,8])+StrToInt(SG1.Cells[2,8])
        +StrToInt(SG1.Cells[4,8])-StrToInt(SG1.Cells[5,8])-StrToInt(SG1.Cells[7,8])));//待磨5
        SG1.Cells[8,9]:=IntToStr(StrToInt(SG1.Cells[9,9])-(StrToInt(SG1.Cells[1,9])+StrToInt(SG1.Cells[2,9])
        +StrToInt(SG1.Cells[4,9])-StrToInt(SG1.Cells[5,9])-StrToInt(SG1.Cells[7,9]))); //待磨6
        SG1.Cells[8,10]:=IntToStr(StrToInt(SG1.Cells[9,10])-(StrToInt(SG1.Cells[1,10])+StrToInt(SG1.Cells[2,10])
        -StrToInt(SG1.Cells[3,10])+StrToInt(SG1.Cells[6,10])-StrToInt(SG1.Cells[7,10]))); //已磨1
        SG1.Cells[8,11]:=IntToStr(StrToInt(SG1.Cells[9,11])-(StrToInt(SG1.Cells[1,11])+StrToInt(SG1.Cells[2,11])
        -StrToInt(SG1.Cells[3,11])+StrToInt(SG1.Cells[6,11])-StrToInt(SG1.Cells[7,11]))); //已磨2
        SG1.Cells[8,12]:=IntToStr(StrToInt(SG1.Cells[9,12])-(StrToInt(SG1.Cells[1,12])+StrToInt(SG1.Cells[2,12])
        -StrToInt(SG1.Cells[3,12])+StrToInt(SG1.Cells[6,12])-StrToInt(SG1.Cells[7,12]))); //已磨3
        SG1.Cells[8,13]:=IntToStr(StrToInt(SG1.Cells[9,13])-(StrToInt(SG1.Cells[1,13])+StrToInt(SG1.Cells[2,13])
        -StrToInt(SG1.Cells[3,13])+StrToInt(SG1.Cells[6,13])-StrToInt(SG1.Cells[7,13])));  //已磨4
        SG1.Cells[8,14]:=IntToStr(StrToInt(SG1.Cells[9,14])-(StrToInt(SG1.Cells[1,14])+StrToInt(SG1.Cells[2,14])
        -StrToInt(SG1.Cells[3,14])+StrToInt(SG1.Cells[6,14])-StrToInt(SG1.Cells[7,14]))); //已磨5
        SG1.Cells[8,15]:=IntToStr(StrToInt(SG1.Cells[9,15])-(StrToInt(SG1.Cells[1,15])+StrToInt(SG1.Cells[2,15])
        -StrToInt(SG1.Cells[3,15])+StrToInt(SG1.Cells[6,15])-StrToInt(SG1.Cells[7,15])));  //已磨6
//        SG1.Cells[5,16]:=IntToStr(StrToInt(SG1.Cells[5,3])+StrToInt(SG1.Cells[5,4])+StrToInt(SG1.Cells[5,5])+StrToInt(SG1.Cells[5,6])+StrToInt(SG1.Cells[5,7])+StrToInt(SG1.Cells[5,8])+StrToInt(SG1.Cells[5,9])-
//        StrToInt(SG1.Cells[6,10])-StrToInt(SG1.Cells[6,11])-StrToInt(SG1.Cells[6,12])-StrToInt(SG1.Cells[6,13])-StrToInt(SG1.Cells[6,14])-StrToInt(SG1.Cells[6,15])-StrToInt(SG1.Cells[7,16])); //研磨房
        //期末合计库存
//        CountSG(SG1);
        SG1.Cells[9,SG1.RowCount-1]:=IntToStr(StrToInt(SG1.Cells[1,SG1.RowCount-1])+StrToInt(SG1.Cells[2,SG1.RowCount-1])-StrToInt(SG1.Cells[3,SG1.RowCount-1])
        +StrToInt(SG1.Cells[4,SG1.RowCount-1])-StrToInt(SG1.Cells[5,SG1.RowCount-1])+StrToInt(SG1.Cells[6,SG1.RowCount-1])-StrToInt(SG1.Cells[7,SG1.RowCount-1]));
        SG1.Cells[9,1]:='0';
end;

procedure TFrm_Main.ShowNewStorageTOSG(SG:TStringGrid;const dBegin,dEndDate:string;iRow:Integer=0);
var i,iLen,iLen2,iLen3:Integer;
    sNo:string;
begin
  TDM.Adosd220.Close;
  TDM.Adosd220.Parameters.ParamByName('dBeinDate').Value:=dBegin;
  TDM.Adosd220.Parameters.ParamByName('dEndDate').Value:=dEndDate;
  TDM.Adosd220.Parameters.ParamByName('TType').Value:='0';
  TDM.Adosd220.Open;
  if TDM.Adosd220.RecordCount>0 then
  begin
    for i:=1 to SG.RowCount-2 do
    begin
      iLen:=Length(SG.Cells[0,i]);
      iLen2:=Pos('(',SG.Cells[0,i]);
      iLen3:=Pos(')',SG.Cells[0,i]);
      sNo:=Copy(SG.Cells[0,i],iLen2+1,iLen3-iLen2-1);
      TDM.Adosd220.First;
      while not TDM.Adosd220.Eof do
      begin
        if (sNo=TDM.Adosd220.FieldByName('Location_code').AsString) then
        begin
          SG.Cells[iRow,i]:=TDM.Adosd220.FieldByName('iSum').AsString;
          TDM.Adosd220.Next;
        end else TDM.Adosd220.Next;
      end;
    end;
  end;
end;

procedure TFrm_Main.ShowNewStorageTOSG2(SG:TStringGrid;const dBegin,dEndDate:string;iRow:Integer=0);
var i,iLen,iLen2,iLen3:Integer;
    sNo:string;
begin
  TDM.Adosd220.Close;
  TDM.Adosd220.Parameters.ParamByName('dBeinDate').Value:=dBegin;
  TDM.Adosd220.Parameters.ParamByName('dEndDate').Value:=dEndDate;
  TDM.Adosd220.Parameters.ParamByName('TType').Value:='0';
  TDM.Adosd220.Open;
  if TDM.Adosd220.RecordCount>0 then
  begin
    for i:=1 to SG.RowCount-2 do
    begin
      iLen:=Length(SG.Cells[0,i]);
      iLen2:=Pos('(',SG.Cells[0,i]);
      iLen3:=Pos(')',SG.Cells[0,i]);
      sNo:=Copy(SG.Cells[0,i],iLen2+1,iLen3-iLen2-1);
      TDM.Adosd220.First;
      while not TDM.Adosd220.Eof do
      begin
        if (sNo=TDM.Adosd220.FieldByName('Location_code').AsString) then
        begin
          SG.Cells[iRow,i]:=IntToStr(StrToInt(TDM.Adosd220.FieldByName('iSum').AsString)-StrToInt(SG.Cells[1,i]));
          TDM.Adosd220.Next;
        end else TDM.Adosd220.Next;
      end;
    end;
  end;
end;

procedure TFrm_Main.CountSG;
var i,iSum:Integer;
begin
//  for i :=1 to SG.RowCount-2 do
//  begin
//    if (Trim(SG.Cells[1,i])='') then SG.Cells[1,i]:='0';
//    if (Trim(SG.Cells[2,i])='') then SG.Cells[2,i]:='0';
//    if (Trim(SG.Cells[9,i])='') then SG.Cells[9,i]:='0';
//    if (Trim(SG.Cells[7,i])='') then SG.Cells[7,i]:='0';
//    SG.Cells[9,i]:=IntToStr(StrToInt(SG.Cells[1,i])+StrToInt(SG.Cells[2,i])-StrToInt(SG.Cells[7,i]));
//  end;
  SG1.Cells[9,2]:=IntToStr(StrToInt(SG1.Cells[1,2])+StrToInt(SG1.Cells[2,2])
  -StrToInt(SG1.Cells[3,2])-StrToInt(SG1.Cells[7,2])); //新钻
  SG1.Cells[9,3]:=IntToStr(StrToInt(SG1.Cells[1,3])+StrToInt(SG1.Cells[2,3])
  +StrToInt(SG1.Cells[4,3])-StrToInt(SG1.Cells[5,3])-StrToInt(SG1.Cells[7,3]));//待磨0
  SG1.Cells[9,4]:=IntToStr(StrToInt(SG1.Cells[1,4])+StrToInt(SG1.Cells[2,4])
  +StrToInt(SG1.Cells[4,4])-StrToInt(SG1.Cells[5,4])-StrToInt(SG1.Cells[7,4]));//待磨1
  SG1.Cells[9,5]:=IntToStr(StrToInt(SG1.Cells[1,5])+StrToInt(SG1.Cells[2,5])
  +StrToInt(SG1.Cells[4,5])-StrToInt(SG1.Cells[5,5])-StrToInt(SG1.Cells[7,5]));//待磨2
  SG1.Cells[9,6]:=IntToStr(StrToInt(SG1.Cells[1,6])+StrToInt(SG1.Cells[2,6])
  +StrToInt(SG1.Cells[4,6])-StrToInt(SG1.Cells[5,6])-StrToInt(SG1.Cells[7,6]));//待磨3
  SG1.Cells[9,7]:=IntToStr(StrToInt(SG1.Cells[1,7])+StrToInt(SG1.Cells[2,7])
  +StrToInt(SG1.Cells[4,7])-StrToInt(SG1.Cells[5,7])-StrToInt(SG1.Cells[7,7]));//待磨4
  SG1.Cells[9,8]:=IntToStr(StrToInt(SG1.Cells[1,8])+StrToInt(SG1.Cells[2,8])
  +StrToInt(SG1.Cells[4,8])-StrToInt(SG1.Cells[5,8])-StrToInt(SG1.Cells[7,8]));//待磨5
  SG1.Cells[9,9]:=IntToStr(StrToInt(SG1.Cells[1,9])+StrToInt(SG1.Cells[2,9])
  +StrToInt(SG1.Cells[4,9])-StrToInt(SG1.Cells[5,9])-StrToInt(SG1.Cells[7,9])); //待磨6
  SG1.Cells[9,10]:=IntToStr(StrToInt(SG1.Cells[1,10])+StrToInt(SG1.Cells[2,10])
  -StrToInt(SG1.Cells[3,10])+StrToInt(SG1.Cells[6,10])-StrToInt(SG1.Cells[7,10])); //已磨1
  SG1.Cells[9,11]:=IntToStr(StrToInt(SG1.Cells[1,11])+StrToInt(SG1.Cells[2,11])
  -StrToInt(SG1.Cells[3,11])+StrToInt(SG1.Cells[6,11])-StrToInt(SG1.Cells[7,11])); //已磨2
  SG1.Cells[9,12]:=IntToStr(StrToInt(SG1.Cells[1,12])+StrToInt(SG1.Cells[2,12])
  -StrToInt(SG1.Cells[3,12])+StrToInt(SG1.Cells[6,12])-StrToInt(SG1.Cells[7,12])); //已磨3
  SG1.Cells[9,13]:=IntToStr(StrToInt(SG1.Cells[1,13])+StrToInt(SG1.Cells[2,13])
  -StrToInt(SG1.Cells[3,13])+StrToInt(SG1.Cells[6,13])-StrToInt(SG1.Cells[7,13]));  //已磨4
  SG1.Cells[9,14]:=IntToStr(StrToInt(SG1.Cells[1,14])+StrToInt(SG1.Cells[2,14])
  -StrToInt(SG1.Cells[3,14])+StrToInt(SG1.Cells[6,14])-StrToInt(SG1.Cells[7,14])); //已磨5
  SG1.Cells[9,15]:=IntToStr(StrToInt(SG1.Cells[1,15])+StrToInt(SG1.Cells[2,15])
  -StrToInt(SG1.Cells[3,15])+StrToInt(SG1.Cells[6,15])-StrToInt(SG1.Cells[7,15]));  //已磨6

  SG1.Cells[9,16]:=IntToStr(StrToInt(SG1.Cells[1,16])+StrToInt(SG1.Cells[5,3])+StrToInt(SG1.Cells[5,4])+StrToInt(SG1.Cells[5,5])+StrToInt(SG1.Cells[5,6])+StrToInt(SG1.Cells[5,7])+StrToInt(SG1.Cells[5,8])+StrToInt(SG1.Cells[5,9])-
  StrToInt(SG1.Cells[6,10])-StrToInt(SG1.Cells[6,11])-StrToInt(SG1.Cells[6,12])-StrToInt(SG1.Cells[6,13])-StrToInt(SG1.Cells[6,14])-StrToInt(SG1.Cells[6,15])-StrToInt(SG1.Cells[7,16])); //研磨房
end;

procedure TFrm_Main.SumSG(SG:TStringGrid);
var i,j,iSum:Integer;
begin
  for i :=2 to SG.ColCount-2 do
  begin
    iSum:=0;
    for j :=1  to SG.RowCount-2 do
    begin
      if (Trim(SG.Cells[i,j])='') then SG.Cells[i,j]:='0';
      iSum:=iSum+StrToInt(SG.Cells[i,j]);
    end;
    SG.Cells[i,SG.RowCount-1]:=IntToStr(iSum);
  end;
end;
//显示发送收回研磨房
procedure TFrm_Main.show220ToSG2(SG:TStringGrid;AdoConn: TADOConnection;
const sSQL,TTYpe,dBegin,dEndDate:string;iRow:Integer=0;iCol:Integer=0);
var tmpAdo:TADOQuery;
    strSQL:string;
begin
  strSQL:=sSQL;
  try
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=ADOConn;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:=strSQL;
        tmpAdo.Parameters.ParamByName('dBeinDate').Value:=dBegin;
        tmpAdo.Parameters.ParamByName('dEndDate').Value:=dEndDate;
        tmpAdo.Parameters.ParamByName('TType').Value:=TTYpe;
        tmpAdo.Open;
      if (tmpAdo.RecordCount>0) then
      begin
        tmpAdo.First;
        while not tmpAdo.Eof do
        begin
          if (TTYpe='3') then
          begin
            if (tmpAdo.FieldByName('OH_degree').AsInteger=0) then
              SG.Cells[iCol,iRow]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=1) then
              SG.Cells[iCol,iRow+1]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=2) then
              SG.Cells[iCol,iRow+2]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=3) then
              SG.Cells[iCol,iRow+3]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=4) then
              SG.Cells[iCol,iRow+4]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=5) then
              SG.Cells[iCol,iRow+5]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=6) then
              SG.Cells[iCol,iRow+6]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger);
            tmpAdo.Next;
          end else
          if (TTYpe='4') then
          begin
            if (tmpAdo.FieldByName('OH_degree').AsInteger=1) then
              SG.Cells[iCol,iRow]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=2) then
              SG.Cells[iCol,iRow+1]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=3) then
              SG.Cells[iCol,iRow+2]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=4) then
              SG.Cells[iCol,iRow+3]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=5) then
              SG.Cells[iCol,iRow+4]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=6) then
              SG.Cells[iCol,iRow+5]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger);
            tmpAdo.Next;
          end;
        end;
      end;
    except
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

//显示
procedure TFrm_Main.show220ToSG(SG:TStringGrid;AdoConn: TADOConnection;const sSQL,TTYpe,dBegin,dEndDate:string;iRow:Integer=0;iCol:Integer=0);
var tmpAdo:TADOQuery;
    strSQL:string;
begin
  strSQL:=sSQL;
  try
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=ADOConn;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:=strSQL;
      tmpAdo.Parameters.ParamByName('dBeinDate').Value:=StrToDate(dBegin);
      tmpAdo.Parameters.ParamByName('dEndDate').Value:=StrToDate(dEndDate);
      tmpAdo.Parameters.ParamByName('TType').Value:=TTYpe;
      tmpAdo.Open;
      if (tmpAdo.RecordCount>0) then
      begin
        tmpAdo.First;
        while not tmpAdo.Eof do
        begin
          if (TTYpe='1') then
          begin
            if (tmpAdo.FieldByName('OH_degree').AsInteger=0) then
              SG.Cells[iCol,iRow-8]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=1) then
              SG.Cells[iCol,iRow]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=2) then
              SG.Cells[iCol,iRow+1]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=3) then
              SG.Cells[iCol,iRow+2]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=4) then
              SG.Cells[iCol,iRow+3]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=5) then
              SG.Cells[iCol,iRow+4]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=6) then
              SG.Cells[iCol,iRow+5]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger);
            tmpAdo.Next;
          end else
          if (TTYpe='2') then
          begin
            if (tmpAdo.FieldByName('OH_degree').AsInteger=0) then
              SG.Cells[iCol,iRow]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=1) then
              SG.Cells[iCol,iRow+1]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=2) then
              SG.Cells[iCol,iRow+2]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=3) then
              SG.Cells[iCol,iRow+3]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=4) then
              SG.Cells[iCol,iRow+4]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=5) then
              SG.Cells[iCol,iRow+5]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger)
            else if (tmpAdo.FieldByName('OH_degree').AsInteger=6) then
              SG.Cells[iCol,iRow+6]:=IntToStr(tmpAdo.FieldByName('iSum').AsInteger);
            tmpAdo.Next;
          end;
        end;
      end;
    except
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;
//显示0224到StringGrid期初值
procedure TFrm_Main.Show0224TOSG(SG:TStringGrid;s223Rkey:string='';iRow:Integer=0);
var i,iLen,iLen2,iLen3:Integer;
    sNo:string;
    iSum:Integer;
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
      if (SG.Cells[0,i]='合计') then sNo:='合计' else
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
    for i :=1  to SG1.RowCount-1 do
    begin
      if (Trim(SG1.Cells[0,i])='') then SG1.Cells[0,i]:='0';
    end;
  end;
end;
//显示报废0222到SG-----
procedure TFrm_Main.Show0222TOSG2(SG:TStringGrid;AdoConn: TADOConnection;const sSQL,dBegin,dEndDate:string;iRow:Integer=0);
var i,iLen,iLen2,iLen3:Integer;
    sNo:string;
    tmpAdo:TADOQuery;
begin
  try
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=ADOConn;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:=sSQL;
      tmpAdo.Parameters.ParamByName('dBeinDate').Value:=StrToDate(dBegin);
      tmpAdo.Parameters.ParamByName('dEndDate').Value:=StrToDate(dEndDate);
      tmpAdo.Open;
      if (tmpAdo.RecordCount>0) then
      begin
        for i:=1 to SG.RowCount-1 do
        begin
          iLen:=Length(SG.Cells[0,i]);
          iLen2:=Pos('(',SG.Cells[0,i]);
          iLen3:=Pos(')',SG.Cells[0,i]);
          sNo:=Copy(SG.Cells[0,i],iLen2+1,iLen3-iLen2-1);
          tmpAdo.First;
          while not tmpAdo.Eof do
          begin
            if (sNo=tmpAdo.FieldByName('Location_code').AsString) then
            begin
              SG.Cells[iRow,i]:=tmpAdo.FieldByName('iSum').AsString;
              tmpAdo.Next;
            end else tmpAdo.Next;
          end;
        end;
      end;
    except
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

//把ADOQuery的数据显示在StringGrid上.
procedure  TFrm_Main.ShowADOQueryDataOnStringGrid(AdoConn: TADOConnection;SG: TStringGrid);
var iRecordCount, iFieldCount,i: Integer;
    tmpAdo,tmpAdo2:TADOQuery;
begin
  try
    try
      ClearStringGrid(SG1);
      SG.Update;
      SG.ColCount:=10;
      SG.Cells[0,0]:='位置';
      SG.Cells[1,0]:='期初库存';
      SG.Cells[2,0]:='新入库数量';
      SG.Cells[3,0]:='发放机台';
      SG.Cells[4,0]:='机台回收';
      SG.Cells[5,0]:='发放研磨房';
      SG.Cells[6,0]:='研磨房回仓';
      SG.Cells[7,0]:='报废数量';
      SG.Cells[8,0]:='差异数';
      SG.Cells[9,0]:='期末库存';
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=AdoConn;
//      tmpAdo2:=TADOQuery.Create(Application);
//      tmpAdo2.Connection:=AdoConn;
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
//      tmpAdo.Close;
//      tmpAdo.SQL.Clear;
//      tmpAdo.SQL.Add('select LOCATION_NAME,LOCATION_CODE from data0160 where type=3 order by LOCATION_CODE');
//      tmpAdo.Open;
//      i:=SG.RowCount-2;
//      iRowNo:=i+1;
//      while not tmpAdo.Eof do
//      begin
//        SG.Cells[0,i+1]:=tmpAdo.FieldByName('LOCATION_NAME').AsString+'('+tmpAdo.FieldByName('LOCATION_CODE').AsString+')';
//        SG.RowCount:=SG.RowCount+1;
//        i:=i+1;
//        tmpAdo.Next;
//      end;
    except
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;
    SG.Cells[0,SG.RowCount-1]:='合计';
//    SG.RowCount:=SG.RowCount-1;
    SetHeightAndWidthOnStringGrid(SG1,28,95);
    sg.ColWidths[0]:=120;
    SG.Update;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

procedure TFrm_Main.ClearStringGrid(SG: TStringGrid);
begin
  SG.ColCount:=2;
  SG.RowCount:=2;
  SG.Rows[1].Clear;
end;

procedure TFrm_Main.SetHeightAndWidthOnStringGrid(sg: TStringGrid; Height,width: Integer);
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

function TFrm_Main.GetRecordNumber(AdoConn: TADOConnection; const TableName: string; swhere: string):Integer;
var tmpAdo: TADOQuery;
  strWhere: string;
begin
  strWhere := swhere;
  tmpAdo := TAdoQuery.Create(nil);
  tmpAdo.Connection := AdoConn;
  if (strWhere = '') then
  begin
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.add('select * from ' + TableName + '');
    tmpAdo.Open;
  end
  else
  begin
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.add('select * from ' + TableName + ' where ' + strWhere + '');
    tmpAdo.Open;
  end;
  try
    if tmpAdo.RecordCount > 0 then
      Result := tmpAdo.RecordCount
    else
      Result := 0;
  except
    tmpAdo.Close;
    tmpAdo.Connection := nil;
    tmpAdo.Free;
    tmpAdo := nil;
    Result := 0;
  end;
end;

//删除记录
procedure TFrm_Main.DeleteRecord(const TableName, Values: string;
      AdoConn: TADOConnection; LinkTable, LinkField, FindField, whereT, Deleteother: string);
var tmpAdo: TAdoQuery;
begin
  tmpAdo := TAdoQuery.Create(nil);
  try
    tmpAdo.Connection := AdoConn;
    if Trim(Deleteother) <> '' then
    begin
      tmpAdo.Close;
      tmpAdo.SQL.Text := DeleteOther;
      tmpAdo.ExecSQL;
    end;
    if (LinkTable <> '') then
    begin
      tmpAdo.Close;                                                                               
      tmpAdo.SQL.Text := 'Select * from ' + LinkTable
        + ' where ' + LinkField + '=''' + Values + ''' ' + whereT;
      tmpAdo.Open;
      if not tmpAdo.IsEmpty then
        raise Exception.Create('该数据在使用，你不能删除。')
    end;
    if ((FindField<>'') and (Values<>'')) then
    begin
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text := 'Delete from ' + TableName + ' where '
        + FindField + '=''' + Values + ''' ' + whereT;
      tmpAdo.ExecSQL;
    end else
    begin
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text := 'Delete from ' + TableName + ' where ' + whereT;
      tmpAdo.ExecSQL;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

procedure TFrm_Main.BitBtn6Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_Main.FormShow(Sender: TObject);
begin
  iRowNo:=0;
  if (TDM.Ftp=2) then
  begin
    dtpBegin.Date:=TDM.Ado0223dBeginDate.AsDateTime; //第一天
    dtpEnd.Date:=TDM.Ado0223dEndDate.AsDateTime; //月最后一天
    ShowADOQueryDataOnStringGrid(TDM.ADOConn,SG1);  //显示SG
    BitBtn5.Enabled:=False;
    BitBtn1.Enabled:=False;
    BitBtn1Click(Self);
  end else
  begin
    dtpBegin.Date:=StartOfTheMonth(getsystem_date(TDM.ADOQuery1,1)); //第一天
    dtpEnd.Date:=EndOfTheMonth(getsystem_date(TDM.ADOQuery1,1)); //月最后一天
    ShowADOQueryDataOnStringGrid(TDM.ADOConn,SG1);  //显示SG
  end;
end;

procedure TFrm_Main.BitBtn1Click(Sender: TObject);
var tmpAdo,TmpAdo2,TmpAdo3:TADOQuery;
    tmpDate:TDateTime;
    strSQL,sSet,sLocation:string;
    sSQL,sHold:String;
    i,j,iType,iNumber,iSum:Integer;
    dYear,dMonth,dDay:Word;
    sGRN_PTR,s230Rkey:string;
    iLen,iLen2,iLen3:Integer;
    sNo:string;
    dBeginAfterMonths,dEndAfterMonths,dBeginBeforeMonth,dEndBeforMonth:TDateTime;
begin
  if (FormatDateTime('yyyy-mm-dd',dtpEnd.Date)<FormatDateTime('yyyy-mm-dd',StartOfTheMonth(dtpBegin.Date))) then
  begin
    Messagedlg('结束日期不能小于开始日期！',mtinformation,[mbok],0);
    Exit;
  end;
  if (FormatDateTime('yyyy-mm-dd',dtpBegin.Date)<>FormatDateTime('yyyy-mm-dd',StartOfTheMonth(dtpBegin.Date))) then
  begin
    Messagedlg('开始日期只能是月份的第一天！',mtinformation,[mbok],0);
    Exit;
  end;
  if (FormatDateTime('yyyy-mm-dd',dtpEnd.Date)<>FormatDateTime('yyyy-mm-dd',EndOfTheMonth(dtpEnd.Date))) then
  begin
    Messagedlg('结束日期只能是月份的最后一天！',mtinformation,[mbok],0);
    Exit;
  end;
  if (MonthOfTheYear(dtpBegin.Date)<>MonthOfTheYear(dtpEnd.Date)) then
  begin
    ShowMsg('只能查询一个自然月！',1);
    Exit;
  end;
  try
    tmpAdo:=TADOQuery.Create(Application);
    tmpAdo.Connection:=TDM.ADOConn;
    TmpAdo2:=TADOQuery.Create(Application);
    TmpAdo2.Connection:=TDM.ADOConn;
    TmpAdo3:=TADOQuery.Create(Application);
    TmpAdo3.Connection:=TDM.ADOConn;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0221 where status in(0,1,3) and sys_date>='''
    +FormatDateTime('yyyy-mm-dd',dtpBegin.Date)+''' and sys_date<='''+FormatDateTime('yyyy-mm-dd',dtpEnd.Date)+'''');
    tmpAdo.Open;
    if (tmpAdo.RecordCount>0) then
    begin
      ShowMsg('本期内特殊出仓还有未审核的单据,请完成审核再点击试算平衡！！',1);
      Exit;
    end;
    if ((MonthOfTheYear(dtpBegin.Date)=MonthOfTheYear(getsystem_date(tmpAdo,1))) and (MonthOfTheYear(dtpEnd.Date)=MonthOfTheYear(getsystem_date(tmpAdo,1)))) then
    begin
//-----------查询当月期初记录--------------------------------------------------------
      if (TDM.Ftp<>2) then
      begin
        if (DayOfTheMonth(dtpEnd.Date)<>DayOfTheMonth(getsystem_date(tmpAdo,1))) then
        begin
          if (Application.MessageBox('确定本月未到月末就要进行试算平衡?', '操作提示', MB_OKCANCEL + MB_ICONINFORMATION) = IDCANCEL) then Exit;
        end;
      end;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Add('select * from dbo.data0223 where dBeginDate>=:dM and dEndDate<=:dM2');
      tmpAdo.Parameters.ParamByName('dM').Value:=FormatDateTime('yyyy-mm-dd',dtpBegin.Date)+' 0:00:00';
      tmpAdo.Parameters.ParamByName('dM2').Value:=FormatDateTime('yyyy-mm-dd',dtpEnd.Date)+' 23:59:59';
      tmpAdo.Open;
      if (tmpAdo.RecordCount>0) then // 当前月已存在期初记录,新增期末值，保存后自然月期初值。
      begin
        dBeginBeforeMonth:=IncMonth(dtpBegin.Date,-1); //前一个月第一天
        dEndBeforMonth:=EndOfTheMonth(dBeginBeforeMonth); //前一个月最后一天
        dBeginBeforeMonth:=IncMonth(dtpBegin.Date,-1);
        dEndBeforMonth:=EndOfTheMonth(dBeginBeforeMonth);
        i0017_prt:=tmpAdo.FieldByName('Data0017_prt').Value;
        s230Rkey:=tmpAdo.FieldByName('Rkey').Value;
        Show0224TOSG(SG1,s230Rkey,1); //期初
        tmpAdo2.Close;
        tmpAdo2.SQL.Clear;
        tmpAdo2.SQL.Add('select * from dbo.data0223 where dBeginDate=:dM and dEndDate=:dM2');
        tmpAdo2.Parameters.ParamByName('dM').Value:=FormatDateTime('yyyy-mm-dd',dBeginBeforeMonth);
        tmpAdo2.Parameters.ParamByName('dM2').Value:=FormatDateTime('yyyy-mm-dd',dEndBeforMonth);
        tmpAdo2.Open;
        if (tmpAdo2.RecordCount<=0) then //
        begin
           ShowNewStorageTOSG2(SG1,FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),2);
        end else
           ShowNewStorageTOSG(SG1,FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),2);
        ShowRecordTOSG;
      end else
      begin
//---------------begin 第一次期初---------------------------------------------------------------------------
        TmpAdo2.Close;
        TmpAdo2.SQL.Clear;
        TmpAdo2.SQL.Add('select top 1 * from dbo.data0219 where TType=''0'' and location_fromptr is NUll and location_endptr is Null order by Rkey');
        TmpAdo2.Open;
        if (TmpAdo2.RecordCount>0) then
        begin
          sGRN_PTR:=TmpAdo2.FieldBYName('Rkey').Value;
        end else
        begin
          Messagedlg('没有入库数据，请确定！',mtinformation,[mbok],0);
          Exit;
        end;
//-----------------------增-----------------------------------------------
        TmpAdo2.Close;
        TmpAdo2.SQL.Clear;
        strSQL:='select dbo.data0160.Location_code,dbo.data0160.Location_Name,dbo.data0160.type,dbo.data0220.inventory_ptr,sum(dbo.data0220.Quantity) as iSum' 
        +' from dbo.data0220 left join dbo.data0160 on dbo.data0160.Rkey=dbo.data0220.Location_Ptr'
        +' where exists(select distinct Location_ptr from dbo.data0220) and dbo.data0220.GRN_PTR=:Grn_ptr'
        +' group by dbo.data0160.Location_code,dbo.data0160.Location_Name,dbo.data0160.type,dbo.data0220.inventory_ptr';
        TmpAdo2.SQL.Text:=strSQL;
        TmpAdo2.Parameters.ParamByName('Grn_ptr').Value:=sGRN_PTR;
        TmpAdo2.Open;
        if (TmpAdo2.RecordCount>0) then
        begin
          i0017_prt:=tmpAdo2.FieldByName('inventory_ptr').Value;
          for i:=1 to SG1.RowCount-1 do
          begin
            iLen:=Length(SG1.Cells[0,i]);
            iLen2:=Pos('(',SG1.Cells[0,i]);
            iLen3:=Pos(')',SG1.Cells[0,i]);
            sNo:=Copy(SG1.Cells[0,i],iLen2+1,iLen3-iLen2-1);
            TmpAdo2.First;
            while not TmpAdo2.Eof do
            begin
              if (sNo=TmpAdo2.FieldByName('Location_code').AsString) then
              begin
                SG1.Cells[1,i]:=TmpAdo2.FieldByName('iSum').AsString;
                TmpAdo2.Next;
              end else TmpAdo2.Next;
            end;
          end;
          iSum:=0;
          for i :=1  to SG1.RowCount-2 do
          begin
            if (Trim(SG1.Cells[1,i])='') then SG1.Cells[1,i]:='0';
            iSum:=iSum+StrToInt(SG1.Cells[1,i]);
          end;
          SG1.Cells[1,SG1.RowCount-1]:=IntToStr(iSum);
        end;
        ShowNewStorageTOSG2(SG1,FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),2);//新入库存
        ShowRecordTOSG;
      end;
//---------------end 第一次期初---------------------------------------------------------------------------
    end else  //往月（不是当前月）
    begin
      dBeginAfterMonths:=IncMonth(dtpBegin.Date,1);//取到当前月的后一个月第一天日期
      dEndAfterMonths:=EndOfTheMonth(dBeginAfterMonths);//取到当前月的后一个月的最后一天日期
      dBeginBeforeMonth:=IncMonth(dtpBegin.Date,-1);
      dEndBeforMonth:=EndOfTheMonth(dBeginBeforeMonth);
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Add('select * from dbo.data0223 where dBeginDate=:dM and dEndDate=:dM2');
      tmpAdo.Parameters.ParamByName('dM').Value:=FormatDateTime('yyyy-mm-dd',dtpBegin.Date);
      tmpAdo.Parameters.ParamByName('dM2').Value:=FormatDateTime('yyyy-mm-dd',dtpEnd.Date);
      tmpAdo.Open;
      if (tmpAdo.RecordCount>0) then // 往月期初存在，判断后一自然月期初是否存在，存在取出显示为期末库存，不存在，计算出。
      begin
        s230Rkey:=tmpAdo.FieldByName('Rkey').Value;
        i0017_prt:=tmpAdo.FieldByName('Data0017_prt').Value;
        Show0224TOSG(SG1,s230Rkey,1); //期初
        tmpAdo2.Close;
        tmpAdo2.SQL.Clear;
        tmpAdo2.SQL.Add('select * from dbo.data0223 where dBeginDate=:dM and dEndDate=:dM2');
        tmpAdo2.Parameters.ParamByName('dM').Value:=FormatDateTime('yyyy-mm-dd',dBeginBeforeMonth);
        tmpAdo2.Parameters.ParamByName('dM2').Value:=FormatDateTime('yyyy-mm-dd',dEndBeforMonth);
        tmpAdo2.Open;
        if (tmpAdo2.RecordCount<=0) then //
        begin
           ShowNewStorageTOSG2(SG1,FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),2);
        end else
           ShowNewStorageTOSG(SG1,FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),2);
//        ShowNewStorageTOSG(SG1,FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),2);//新入库存
        ShowRecordTOSG;
        TmpAdo2.Close;
        TmpAdo2.SQL.Clear;
        TmpAdo2.SQL.Add('select * from dbo.data0223 where dBeginDate=:dM and dEndDate=:dM2');
        TmpAdo2.Parameters.ParamByName('dM').Value:=FormatDateTime('yyyy-mm-dd',dBeginAfterMonths);
        TmpAdo2.Parameters.ParamByName('dM2').Value:=FormatDateTime('yyyy-mm-dd',dEndAfterMonths);
        TmpAdo2.Open;
        if (TmpAdo2.RecordCount>0) then
        begin
          s230Rkey:=TmpAdo2.FieldByName('Rkey').Value;
          Show0224TOSG(SG1,s230Rkey,11); //期末
        end;
      end else
      begin
//---------------begin 第一次期初---------------------------------------------------------------------------
        TmpAdo3.Close;
        TmpAdo3.SQL.Clear;
        TmpAdo3.SQL.Add('select * from dbo.data0223');
        TmpAdo3.Open;
        if (TmpAdo3.RecordCount<=0) then
        begin
          TmpAdo2.Close;
          TmpAdo2.SQL.Clear;
          TmpAdo2.SQL.Add('select top 1 * from dbo.data0219 where TType=''0'' and location_fromptr is NUll and location_endptr is Null order by Rkey');
          TmpAdo2.Open;
          if (TmpAdo2.RecordCount>0) then
          begin
            if (MonthOfTheYear(TmpAdo2.FieldByName('create_date').AsDateTime)=MonthOfTheYear(dtpBegin.DateTime)) then
            begin
              sGRN_PTR:=TmpAdo2.FieldBYName('Rkey').Value;
              TmpAdo2.Close;
              TmpAdo2.SQL.Clear;
              strSQL:='select dbo.data0160.Location_code,dbo.data0160.Location_Name,dbo.data0160.type,dbo.data0220.inventory_ptr,sum(dbo.data0220.Quantity) as iSum'
              +' from dbo.data0220 left join dbo.data0160 on dbo.data0160.Rkey=dbo.data0220.Location_Ptr'
              +' where exists(select distinct Location_ptr from dbo.data0220) and dbo.data0220.GRN_PTR=:Grn_ptr'
              +' group by dbo.data0160.Location_code,dbo.data0160.Location_Name,dbo.data0160.type,dbo.data0220.inventory_ptr';
              TmpAdo2.SQL.Text:=strSQL;
              TmpAdo2.Parameters.ParamByName('Grn_ptr').Value:=sGRN_PTR;
              TmpAdo2.Open;
              if (TmpAdo2.RecordCount>0) then
              begin
                i0017_prt:=tmpAdo2.FieldByName('inventory_ptr').Value;
                for i:=1 to SG1.RowCount-1 do
                begin
                  iLen:=Length(SG1.Cells[0,i]);
                  iLen2:=Pos('(',SG1.Cells[0,i]);
                  iLen3:=Pos(')',SG1.Cells[0,i]);
                  sNo:=Copy(SG1.Cells[0,i],iLen2+1,iLen3-iLen2-1);
                  TmpAdo2.First;
                  while not TmpAdo2.Eof do
                  begin
                    if (sNo=TmpAdo2.FieldByName('Location_code').AsString) then
                    begin
                      SG1.Cells[1,i]:=TmpAdo2.FieldByName('iSum').AsString;
                      TmpAdo2.Next;
                    end else TmpAdo2.Next;
                  end;
                end;
                iSum:=0;
                for i :=1  to SG1.RowCount-2 do
                begin
                  if (Trim(SG1.Cells[1,i])='') then SG1.Cells[1,i]:='0';
                  iSum:=iSum+StrToInt(SG1.Cells[1,i]);
                end;
                SG1.Cells[1,SG1.RowCount-1]:=IntToStr(iSum);
              end;
              ShowNewStorageTOSG2(SG1,FormatDateTime('yyyy-mm-dd',dtpBegin.Date),FormatDateTime('yyyy-mm-dd',dtpEnd.Date),2);//新入库存
              ShowRecordTOSG;
            end;
          end else
          begin
            Messagedlg('没有当月入库数据，请确定！',mtinformation,[mbok],0);
            Exit;
          end;
        end else
        begin
          ShowMsg('该月份没有平衡记录，请查证！',1);
          Exit;
        end;
      end;
    end;
    SumSG(SG1);
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
end;

procedure TFrm_Main.SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  {文字居中}
  with Sender as TStringGrid do
  begin
    Canvas.FillRect(Rect);
    DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), Length(Cells[ACol, ARow]), Rect, DT_CENTER or DT_SINGLELINE or DT_VCENTER);
  end;
  {文字居中结束}
end;

procedure TFrm_Main.BitBtn2Click(Sender: TObject);
begin
  Export_Grid_to_Excel(SG1,'钻咀月末试算平衡表');
end;

procedure TFrm_Main.BitBtn5Click(Sender: TObject);
var tmpAdo,TmpAdo2,TmpAdo3:TADOQuery;
    sGRN_PTR,s230Rkey:string;
    i,j,iType,iNumber:Integer;
    dBeginAfterMonths,dEndAfterMonths:TDateTime;
    iLen2,iLen3:Integer;
begin
  iNumber:=0;
  if (FormatDateTime('yyyy-mm-dd',dtpEnd.Date)<FormatDateTime('yyyy-mm-dd',StartOfTheMonth(dtpBegin.Date))) then
  begin
    Messagedlg('结束日期不能小于开始日期！',mtinformation,[mbok],0);
    Exit;
  end;
  if (FormatDateTime('yyyy-mm-dd',dtpBegin.Date)<>FormatDateTime('yyyy-mm-dd',StartOfTheMonth(dtpBegin.Date))) then
  begin
    Messagedlg('开始日期只能是月份的第一天！',mtinformation,[mbok],0);
    Exit;
  end;
  if (FormatDateTime('yyyy-mm-dd',dtpEnd.Date)<>FormatDateTime('yyyy-mm-dd',EndOfTheMonth(dtpEnd.Date))) then
  begin
    Messagedlg('结束日期只能是月份的最后一天！',mtinformation,[mbok],0);
    Exit;
  end;
  if (MonthOfTheYear(dtpBegin.Date)<>MonthOfTheYear(dtpEnd.Date)) then
  begin
    ShowMsg('只能查询一个自然月！',1);
    Exit;
  end;
  if ((SG1.Cells[SG1.ColCount-1,SG1.RowCount-1]='')) then
  begin
    ShowMsg('没有数据可保存,请完成审核再点击试算平衡！',1);
    Exit;
  end;
  try
//    if ((MonthOfTheYear(dtpBegin.Date)=MonthOfTheYear(getsystem_date(TDM.ADOQuery1,1))) and (MonthOfTheYear(dtpEnd.Date)=MonthOfTheYear(getsystem_date(TDM.ADOQuery1,1)))) then
//    begin
      dBeginAfterMonths:=IncMonth(dtpBegin.Date,1);
      dEndAfterMonths:=EndOfTheMonth(dBeginAfterMonths);
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=TDM.ADOConn;
      TmpAdo2:=TADOQuery.Create(Application);
      TmpAdo2.Connection:=TDM.ADOConn;
      TmpAdo3:=TADOQuery.Create(Application);
      TmpAdo3.Connection:=TDM.ADOConn;
//------ 查询当前月是否已存在期初记录,存在接着查询下月期初，下月存在删除再保存。当月不存在，保存当月同时保存下月期初-----------------
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Add('select * from dbo.data0223 where dBeginDate=:dM and dEndDate=:dM2');
      tmpAdo.Parameters.ParamByName('dM').Value:=FormatDateTime('yyyy-mm-dd',dtpBegin.Date);
      tmpAdo.Parameters.ParamByName('dM2').Value:=FormatDateTime('yyyy-mm-dd',dtpEnd.Date);
      tmpAdo.Open;
      if (tmpAdo.RecordCount>0) then
      begin
        tmpAdo2.Close;
        tmpAdo2.SQL.Clear;
        tmpAdo2.SQL.Add('select * from dbo.data0223 where dBeginDate=:dM and dEndDate=:dM2');
        tmpAdo2.Parameters.ParamByName('dM').Value:=FormatDateTime('yyyy-mm-dd',dBeginAfterMonths);
        tmpAdo2.Parameters.ParamByName('dM2').Value:=FormatDateTime('yyyy-mm-dd',dEndAfterMonths);
        tmpAdo2.Open;
        if (tmpAdo2.RecordCount>0) then
        begin
          DeleteRecord('data0224',tmpAdo2.FieldBYName('Rkey').Value,TDM.ADOConn,'','','d0223_PTR','','');
          DeleteRecord('data0223',tmpAdo2.FieldBYName('Rkey').Value,TDM.ADOConn,'','','Rkey','','');
        end;
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Add('insert into dbo.data0223 (Data0017_prt,StockDrill,dBeginDate,dEndDate,Data0005_Prt,dMonth,dDate) values(:Data0017_prt,:StockDrill,:dBeginDate,:dEndDate,:Data0005_Prt,:dMonth,:dDate)');
        tmpAdo.Parameters.ParamByName('Data0017_prt').Value:=i0017_prt;
        tmpAdo.Parameters.ParamByName('StockDrill').Value:=SG1.Cells[SG1.ColCount-1,SG1.RowCount-1];
        tmpAdo.Parameters.ParamByName('dBeginDate').Value:=FormatDateTime('yyyy-mm-dd',dBeginAfterMonths);
        tmpAdo.Parameters.ParamByName('dEndDate').Value:=FormatDateTime('yyyy-mm-dd',dEndAfterMonths);
        tmpAdo.Parameters.ParamByName('Data0005_Prt').Value:=user_ptr;
        tmpAdo.Parameters.ParamByName('dMonth').Value:=MonthOfTheYear(dEndAfterMonths);
        tmpAdo.Parameters.ParamByName('dDate').Value:= Now;
        tmpAdo.ExecSQL;
        TmpAdo3.Close;
        TmpAdo3.SQL.Clear;
        TmpAdo3.SQL.Add('select top 1 * from data0223 order by Rkey desc');
        TmpAdo3.Open;
        s230Rkey:=IntToStr(TmpAdo3.FieldByName('Rkey').Value);  //223Rkey
        i0223Rkey:=TmpAdo3.FieldByName('Rkey').Value;
        for i:=1 to SG1.RowCount-1 do
        begin
          iLen2:=Pos('(',SG1.Cells[0,i]);
          iLen3:=Pos(')',SG1.Cells[0,i]);
          sGRN_PTR:=Copy(SG1.Cells[0,i],iLen2+1,iLen3-iLen2-1);
          if (sGRN_PTR='') then sGRN_PTR:='合计';
          iType:=0;
          if (Copy(sGRN_PTR,1,1)='J') then iType:=1;
          if (Copy(sGRN_PTR,1,1)='C') then iType:=1;
          //220入库的新钻数量按160位置插入224数量
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Add('insert into dbo.data0224 (d0223_PTR,d0160_Prt,StockDrill,Difference_Number,sType) values(:d0223_PTR,:d0160_Prt,:StockDrill,:Difference_Number,:sType)');
          tmpAdo.Parameters.ParamByName('d0223_PTR').Value:=s230Rkey;
          tmpAdo.Parameters.ParamByName('d0160_Prt').Value:=sGRN_PTR;
          tmpAdo.Parameters.ParamByName('StockDrill').Value:=SG1.Cells[9,i];
          tmpAdo.Parameters.ParamByName('Difference_Number').Value:=SG1.Cells[8,i];
          tmpAdo.Parameters.ParamByName('sType').Value:=iType;
          tmpAdo.ExecSQL;
          iNumber:=iNumber+1;
        end;
      end else
      begin
//---------------当前月不存在记录，先保存当前月平衡表，再保存下月期初平衡表---------------------------------------------------------------------------
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Add('insert into dbo.data0223 (Data0017_prt,StockDrill,dBeginDate,dEndDate,Data0005_Prt,dMonth,dDate) values(:Data0017_prt,:StockDrill,:dBeginDate,:dEndDate,:Data0005_Prt,:dMonth,:dDate)');
        tmpAdo.Parameters.ParamByName('Data0017_prt').Value:=i0017_prt;
        tmpAdo.Parameters.ParamByName('StockDrill').Value:=SG1.Cells[1,SG1.RowCount-1];
        tmpAdo.Parameters.ParamByName('dBeginDate').Value:=FormatDateTime('yyyy-mm-dd',dtpBegin.Date);
        tmpAdo.Parameters.ParamByName('dEndDate').Value:=FormatDateTime('yyyy-mm-dd',dtpEnd.Date);
        tmpAdo.Parameters.ParamByName('Data0005_Prt').Value:=user_ptr;
        tmpAdo.Parameters.ParamByName('dMonth').Value:=MonthOfTheYear(dtpEnd.Date);
        tmpAdo.Parameters.ParamByName('dDate').Value:= Now;
        tmpAdo.ExecSQL;
        TmpAdo3.Close;
        TmpAdo3.SQL.Clear;
        TmpAdo3.SQL.Add('select * from dbo.data0223');
        TmpAdo3.Open;
        s230Rkey:=IntToStr(TmpAdo3.FieldByName('Rkey').Value);  //223Rkey
        i0223Rkey:=TmpAdo3.FieldByName('Rkey').Value;
        for i:=1 to SG1.RowCount-1 do
        begin
          iLen2:=Pos('(',SG1.Cells[0,i]);
          iLen3:=Pos(')',SG1.Cells[0,i]);
          sGRN_PTR:=Copy(SG1.Cells[0,i],iLen2+1,iLen3-iLen2-1);
          if (sGRN_PTR='') then sGRN_PTR:='合计';
          iType:=0;
          if (Copy(sGRN_PTR,1,1)='J') then iType:=1;
          if (Copy(sGRN_PTR,1,1)='C') then iType:=1;
          TmpAdo2.Close;
          TmpAdo2.SQL.Clear;
          TmpAdo2.SQL.Add('insert into dbo.data0224 (d0223_PTR,d0160_Prt,StockDrill,Difference_Number,sType) values(:d0223_PTR,:d0160_Prt,:StockDrill,:Difference_Number,:sType)');
          TmpAdo2.Parameters.ParamByName('d0223_PTR').Value:=s230Rkey;
          TmpAdo2.Parameters.ParamByName('d0160_Prt').Value:=sGRN_PTR;
          TmpAdo2.Parameters.ParamByName('StockDrill').Value:=SG1.Cells[1,i];
          TmpAdo2.Parameters.ParamByName('Difference_Number').Value:='0';
          TmpAdo2.Parameters.ParamByName('sType').Value:=iType;
          TmpAdo2.ExecSQL;
        end;
//-------------------------保存下个月期初----------------------------------------
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Add('insert into dbo.data0223 (Data0017_prt,StockDrill,dBeginDate,dEndDate,Data0005_Prt,dMonth,dDate) values(:Data0017_prt,:StockDrill,:dBeginDate,:dEndDate,:Data0005_Prt,:dMonth,:dDate)');
        tmpAdo.Parameters.ParamByName('Data0017_prt').Value:=i0017_prt;
        tmpAdo.Parameters.ParamByName('StockDrill').Value:=SG1.Cells[SG1.ColCount-1,SG1.RowCount-1];
        tmpAdo.Parameters.ParamByName('dBeginDate').Value:=FormatDateTime('yyyy-mm-dd',dBeginAfterMonths);
        tmpAdo.Parameters.ParamByName('dEndDate').Value:=FormatDateTime('yyyy-mm-dd',dEndAfterMonths);
        tmpAdo.Parameters.ParamByName('Data0005_Prt').Value:=user_ptr;
        tmpAdo.Parameters.ParamByName('dMonth').Value:=MonthOfTheYear(dEndAfterMonths);
        tmpAdo.Parameters.ParamByName('dDate').Value:= Now;
        tmpAdo.ExecSQL;
        TmpAdo3.Close;
        TmpAdo3.SQL.Clear;
        TmpAdo3.SQL.Add('select top 1 * from data0223 order by Rkey desc');
        TmpAdo3.Open;
        s230Rkey:=IntToStr(TmpAdo3.FieldByName('Rkey').Value);  //223Rkey
        for i:=1 to SG1.RowCount-1 do
        begin
          iLen2:=Pos('(',SG1.Cells[0,i]);
          iLen3:=Pos(')',SG1.Cells[0,i]);
          sGRN_PTR:=Copy(SG1.Cells[0,i],iLen2+1,iLen3-iLen2-1);
          if (sGRN_PTR='') then sGRN_PTR:='合计';
          iType:=0;
          if (Copy(sGRN_PTR,1,1)='J') then iType:=1;
          if (Copy(sGRN_PTR,1,1)='C') then iType:=1;
          //220入库的新钻数量按160位置插入224数量
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Add('insert into dbo.data0224 (d0223_PTR,d0160_Prt,StockDrill,Difference_Number,sType) values(:d0223_PTR,:d0160_Prt,:StockDrill,:Difference_Number,:sType)');
          tmpAdo.Parameters.ParamByName('d0223_PTR').Value:=s230Rkey;
          tmpAdo.Parameters.ParamByName('d0160_Prt').Value:=sGRN_PTR;
          tmpAdo.Parameters.ParamByName('StockDrill').Value:=SG1.Cells[9,i];
          tmpAdo.Parameters.ParamByName('Difference_Number').Value:=SG1.Cells[8,i];
          tmpAdo.Parameters.ParamByName('sType').Value:=iType;
          tmpAdo.ExecSQL;
          iNumber:=iNumber+1;
        end;
      end;
    if (iNumber>0) then
    begin
      ShowMsg('保存成功！',1);
    end;
    modalresult:=mrok;
//---------------end 第一次期初---------------------------------------------------------------------------
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
end;

procedure TFrm_Main.BitBtn3Click(Sender: TObject);
begin
//  frmJiTai:=TfrmJiTai.Create(Application);
//  frmJiTai.ShowModal;
//  frmJiTai.Free;
end;

end.
