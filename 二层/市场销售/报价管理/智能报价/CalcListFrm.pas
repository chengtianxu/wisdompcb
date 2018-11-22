unit CalcListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, ExtCtrls, damo, ComCtrls, StdCtrls,
  Buttons;

type
  TfrmCalcList = class(TForm)
    pnl2: TPanel;
    ds164: TDataSource;
    ads164: TADODataSet;
    pnlTop: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    pnlAll: TPanel;
    pnlRight: TPanel;
    btnAppend: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts3: TTabSheet;
    eh3: TDBGridEh;
    ads316: TADODataSet;
    ds316: TDataSource;
    ts4: TTabSheet;
    ds311: TDataSource;
    ads311: TADODataSet;
    ads311TName: TStringField;
    ads311TDesc: TStringField;
    ads311XCount: TIntegerField;
    ads311YCount: TIntegerField;
    ads311VType: TIntegerField;
    eh4: TDBGridEh;
    ads316Rkey: TAutoIncField;
    ads316Spec_Key: TIntegerField;
    ads316ValueStr: TStringField;
    ads311Custom_ptr: TIntegerField;
    ads311CUST_CODE: TStringField;
    eh1: TDBGridEh;
    ads164RKEY: TAutoIncField;
    ads164AddType: TWordField;
    ads164Code: TStringField;
    ads164VisableStr: TStringField;
    ads164ValueStr: TStringField;
    btnHelp: TBitBtn;
    wrdfldads164AddTypeTotal: TWordField;
    wrdfldads164AddTypeEng: TWordField;
    strngfldads164TotalValueStr: TStringField;
    strngfldads164EngValueStr: TStringField;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAppendClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SaveSgToDB(ASG: TStringGrid; AQry: TADOQuery;ATableName: string;acustomptr:string): Boolean;
    function LoadSGFromDB(ASG: TStringGrid;AQry: TADOQuery;ATableName: string;ACustomPTr: string): Boolean;
  end;

implementation

uses
  Edit164Frm, Edit317Frm, Edit316Frm, Table2DEditFrm;

{$R *.dfm}

procedure TfrmCalcList.btnExitClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCalcList.btnRefreshClick(Sender: TObject);
begin
  ads164.Requery();
  ads316.Requery();
  ads311.Requery();
end;

procedure TfrmCalcList.FormShow(Sender: TObject);
begin
  pgc1.ActivePageIndex := 0;
  if not ads164.Active then ads164.Open;
  if not ads316.Active then ads316.Open;
  if not ads311.Active then ads311.Open;
end;


procedure TfrmCalcList.btnAppendClick(Sender: TObject);
begin
  case pgc1.ActivePageIndex of
    0://加价项
    begin
      with TfrmEdit164.Create(Self) do
      begin
        try
          if ShowModal = mrok then
          begin
            ads164.Append;
            ads164.FieldByName('code').AsString := edtPtr.Text;
            ads164.fieldbyname('addtype').AsInteger := rgAddType.ItemIndex;
            ads164.fieldbyname('VisableStr').AsString := mmoEnableStr.Text;
            ads164.fieldbyname('ValueStr').AsString := mmoValueStr.Text;

            ads164.fieldbyname('addtypetotal').AsInteger := rgAddTypeTotal.ItemIndex;
            ads164.fieldbyname('TotalValueStr').AsString := mmoValueStrTotal.Text;

            ads164.fieldbyname('addtypeEng').AsInteger := rgAddTypeEng.ItemIndex;
            ads164.fieldbyname('EngValueStr').AsString := mmoValueStrEng.Text;
            ads164.Post;
          end;
        finally
          Free;
        end;
      end;
    end;
    1://基价公式
    begin
      with Tfrmedit316.Create(Self) do
      begin
        try
          FTag := 0;
          FEditrkey := 0;
          if ShowModal = mrok then
            ads316.Requery();
        finally
          Free;
        end;
      end;
    end;
    2://基础表格
    begin
      with TfrmTable2DEdit.Create(Self) do
      begin
        try
          if ShowModal = mrok then
          begin
            dm.ADOConn.BeginTrans;
            try
              ads311.Append;
              ads311.fieldbyname('TName').AsString := edtTableName.Text;
              ads311.fieldbyname('XCount').AsString := edtXCount.Text;
              ads311.fieldbyname('YCount').AsString := edtYCount.Text;
              ads311.fieldbyname('TDesc').AsString := edtDesc.Text;
              ads311.fieldbyname('VType').AsInteger := rg1.ItemIndex;
              ads311.FieldByName('custom_ptr').AsInteger := edtCustom.Tag;
              ads311.Post;

              SaveSgToDB(sg1,dm.qrytmp,edtTableName.Text,ads311.FieldByName('custom_ptr').AsString);

              dm.ADOConn.CommitTrans;
            finally
              if dm.ADOConn.InTransaction then dm.ADOConn.RollbackTrans;
            end;
          end;
        finally
          Free;
        end;
      end;
      btnRefreshClick(btnRefresh);
    end;
  end;
end;

procedure TfrmCalcList.btnEditClick(Sender: TObject);
begin
  case pgc1.ActivePageIndex of
    0://加价项
    begin
      with TfrmEdit164.Create(Self) do
      begin
        try
          edtPtr.Text := ads164.fieldbyname('code').AsString;
          rgAddType.ItemIndex := ads164.fieldbyname('addtype').AsInteger;
          mmoEnableStr.Text := ads164.fieldbyname('VisableStr').AsString;
          mmoValueStr.Text := ads164.fieldbyname('ValueStr').AsString;

          rgAddTypeTotal.ItemIndex := ads164.fieldbyname('addtypetotal').AsInteger;
          mmoValueStrTotal.Text := ads164.fieldbyname('TotalValueStr').AsString;

          rgAddTypeEng.ItemIndex := ads164.fieldbyname('addtypeEng').AsInteger;
          mmoValueStrEng.Text := ads164.fieldbyname('EngValueStr').AsString;

          if ShowModal = mrok then
          begin
            ads164.Edit;
            ads164.fieldbyname('code').AsString := edtPtr.Text;
            ads164.fieldbyname('addtype').AsInteger := rgAddType.ItemIndex;
            ads164.fieldbyname('VisableStr').AsString := mmoEnableStr.Text;
            ads164.fieldbyname('ValueStr').AsString := mmoValueStr.Text;

            ads164.fieldbyname('addtypetotal').AsInteger := rgAddTypeTotal.ItemIndex;
            ads164.fieldbyname('TotalValueStr').AsString := mmoValueStrTotal.Text;

            ads164.fieldbyname('addtypeEng').AsInteger := rgAddTypeEng.ItemIndex;
            ads164.fieldbyname('EngValueStr').AsString := mmoValueStrEng.Text; 

            ads164.Post;
          end;
        finally
          Free;
        end;
      end;
    end;
    1://基价取值公式
    begin
    //0制版费
    //1工程费
    //2测试费
    //3金手指费
    //4加急费
    //5菲林费
      with Tfrmedit316.Create(Self) do
      begin
        try
          FTag := 1;
          FEditrkey := ads316.fieldbyname('rkey').AsInteger;
          cbb1.ItemIndex := ads316.fieldbyname('spec_key').AsInteger;
          mmoCalcStr.Text := ads316.fieldbyname('valuestr').AsString;
          if ShowModal = mrok then
            ads316.Requery();
        finally
          Free;
        end;
      end;
    end;
    2: //表格
    begin
      with TfrmTable2DEdit.Create(Self) do
      begin
        FTag := 1;
        edtTableName.ReadOnly := True;
        LoadSGFromDB(sg1,dm.qrytmp,ads311.fieldbyname('TName').AsString,ads311.fieldbyname('custom_ptr').AsString);
        edtTableName.Text := ads311.fieldbyname('TName').AsString;
        edtXCount.Text := ads311.fieldbyname('XCount').AsString;
        edtYCount.Text := ads311.fieldbyname('YCount').AsString;
        edtDesc.Text := ads311.fieldbyname('TDesc').AsString;
        rg1.ItemIndex := ads311.fieldbyname('VType').AsInteger;
        edtCustom.Tag := ads311.fieldbyname('custom_ptr').AsInteger;
        edtCustom.Text := ads311.fieldbyname('cust_code').AsString;
        try
          if ShowModal = mrok then
          begin
            dm.ADOConn.BeginTrans;
            try
              ads311.Edit;
              ads311.fieldbyname('TName').AsString := edtTableName.Text;
              ads311.fieldbyname('XCount').AsString := edtXCount.Text;
              ads311.fieldbyname('YCount').AsString := edtYCount.Text;
              ads311.fieldbyname('TDesc').AsString := edtDesc.Text;
              ads311.fieldbyname('VType').AsInteger := rg1.ItemIndex;
              ads311.FieldByName('custom_ptr').AsInteger := edtCustom.Tag;
              ads311.Post;

              SaveSgToDB(sg1,dm.qrytmp,edtTableName.Text,ads311.FieldByName('custom_ptr').AsString);

              dm.ADOConn.CommitTrans;

            finally
              if dm.ADOConn.InTransaction then dm.ADOConn.RollbackTrans;
            end;
          end;
        finally
          Free;
        end;
      end;
      btnRefreshClick(btnRefresh);
    end;
  end;
end;

procedure TfrmCalcList.btnDeleteClick(Sender: TObject);
begin
  case pgc1.ActivePageIndex of
    0:
    begin
      ads164.Delete;
    end;
    1:
    begin
      ads316.Delete;
    end;
    2:
    begin
      ads311.Delete;
    end;
  end;
end;

function TfrmCalcList.LoadSGFromDB(ASG: TStringGrid; AQry: TADOQuery;
  ATableName: string; acustomptr: string): Boolean;
var
  LSql: string;
begin
  //取得311中数据设置SG
  if (ACustomPTr = '') or (ACustomPTr = '0') then
  begin
    LSql := 'select * from data0311 where TName = ' + QuotedStr(ATableName);
  end else
  begin
    LSql := 'select * from data0311 where TName = ' + QuotedStr(ATableName) +' and custom_ptr = ' + ACustomPTr;
  end;
  AQry.Close;
  AQry.SQL.Clear;
  AQry.SQL.Add(LSql);
  AQry.Open;
  ASG.ColCount := AQry.fieldbyname('XCount').AsInteger;
  ASG.RowCount := AQry.fieldbyname('YCount').AsInteger;
  //读取312
  if (ACustomPTr = '') or (ACustomPTr = '0') then
  begin  
    LSql := 'select * from data0312 where Ptr_311 = ' + QuotedStr(ATableName);
  end else
  begin
    LSql := 'select * from data0312 where Ptr_311 = ' + QuotedStr(ATableName) +' and custom_ptr = ' + ACustomPTr;;
  end;
  AQry.Close;
  AQry.SQL.Clear;
  AQry.SQL.Add(LSql);
  AQry.Open;
  //初始化列
  AQry.First;
  while not AQry.Eof do
  begin
    ASG.Cells[AQry.FieldByName('Cell_Col').AsInteger,AQry.FieldByName('Cell_Row').AsInteger] :=
      AQry.fieldbyname('TValue').AsString;
    AQry.Next;
  end;
  //初始化行

  //得到行列的位置，填写value
  AQry.Close;
  Result := True;
end;

function TfrmCalcList.SaveSgToDB(ASG: TStringGrid; AQry: TADOQuery;
  ATableName: string; acustomptr:string): Boolean;
var
  LSql: string;
  Col: Integer;
  Row: Integer;
begin
  //清空311
  LSql := 'delete from data0312 where Ptr_311 = ' + QuotedStr(ATableName) + ' and custom_ptr = ' + acustomptr;
  AQry.Close;
  AQry.SQL.Clear;
  AQry.SQL.Add(lsql);
  AQry.ExecSQL;
  //插入312子表记录
  LSql := 'select * from data0312 where Ptr_311 = ' + QuotedStr(ATableName)+ ' and custom_ptr = ' + acustomptr;
  AQry.Close;
  AQry.SQL.Clear;
  AQry.SQL.Add(LSql);
  AQry.Open;

  for Col := 0 to ASG.ColCount-1 do
  begin
    for Row := 0 to ASG.RowCount-1 do
    begin
      AQry.Append;
      AQry.FieldByName('Ptr_311').AsString := ATableName;
      AQry.FieldByName('Y').AsString := ASG.Cells[0,Row];//IntToStr(I);
      AQry.FieldByName('X').AsString := ASG.Cells[Col,0];
      AQry.FieldByName('Cell_Col').AsInteger := Col;
      AQry.FieldByName('Cell_Row').AsInteger := Row;
      AQry.FieldByName('TValue').AsString := ASG.Cells[Col,Row];
      AQry.FieldByName('custom_ptr').AsString := acustomptr;
      AQry.Post;
    end;
  end;

  AQry.Close;
  Result := True;
end;

procedure TfrmCalcList.btnHelpClick(Sender: TObject);
var
  LStr: string;
begin
  LStr := ' HAS[MI.**] 工序或全局中有**这个参数则返回1，否则返回0 ' + #13 +
          ' HAS[DEPT.**] 流程中有**这个工序则返回1，否则返回0 ' + #13 +
          ' MI.**  表示参数**的值 ' + #13 +
          ' [TABLE(X,Y)] 表示取 TABLE 中 X，Y列的值 ' + #13 +
          ' IF{1>0,1,0} IF条件判断语句 ' + #13 +
          ' + - * /  基本四则运算符' + #13 +
          ' >  <  =  逻辑比较运算符 ';
  ShowMessage(LStr);
end;

end.
