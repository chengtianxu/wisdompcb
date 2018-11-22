unit BMListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ExtCtrls, DM, DB, ADODB, ComCtrls;

type
  TfrmBMList = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    edtFilter: TLabeledEdit;
    rg1: TRadioGroup;
    ehBMlist: TDBGridEh;
    pnl3: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    ds1: TDataSource;
    adsBMList: TADODataSet;
    strngfldBMListsteptype: TStringField;
    adsBMListstep_no: TSmallintField;
    strngfldBMListdept_code: TStringField;
    strngfldBMListdept_name: TStringField;
    intgrfldBMListrkey34: TIntegerField;
    tv1: TTreeView;
    procedure rg1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure ehBMlistDblClick(Sender: TObject);
    procedure ehBMlistTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure edtFilterKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
  public
    FRkey06: string;
    FRkey25: string;
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmBMList.rg1Click(Sender: TObject);
var
  LSql: string;
  LNodeArr: array of TTreeNode;
  LNode: TTreeNode;
  LParentNode: TTreeNode;
  I: Integer;
begin
  adsBMList.Close;
  case rg1.ItemIndex of
    0:
    begin
      if FRkey06 = '' then
      begin
        adsBMList.CommandText := 'SELECT RKey AS RKey34, DEPT_CODE, DEPT_NAME ,0 AS STEP_NO, null as steptype FROM Data0034 WHERE 1 = 2';
      end else
      begin
        tv1.Items.Clear;
        LSql := ';WITH CTE(RKey,Lv,MANU_PART_NUMBER,PARENT_PTR) ' +
          ' AS (SELECT RKey,1,MANU_PART_NUMBER,PARENT_PTR ' +
          ' FROM Data0025 WHERE RKey = '+ FRkey25 +' UNION ALL  ' +
          ' SELECT D25.RKey,CTE.Lv+1,D25.MANU_PART_NUMBER,D25.PARENT_PTR ' +
          ' FROM Data0025 D25 INNER JOIN CTE ON D25.PARENT_PTR = CTE.RKey ) SELECT * FROM CTE ORDER BY lv ';

        dm1.QryTmpOpen(LSql);
        while not dm1.qrytmp.Eof do
        begin
          if dm1.qrytmp.FieldByName('LV').AsInteger = 1 then
            LNode := tv1.Items.AddChild(nil,dm1.qrytmp.fieldbyname('MANU_PART_NUMBER').AsString)
          else
          begin
            for I:= 0 to Length(LNodeArr) - 1 do
            begin
              if Integer(LNodeArr[I].Data) = dm1.qrytmp.FieldByName('PARENT_PTR').asinteger then
              begin
                LNode := tv1.Items.AddChild(LNodeArr[I],dm1.qrytmp.fieldbyname('MANU_PART_NUMBER').AsString);
                Break;
              end;
            end;
          end;
          LNode.Data := Pointer(dm1.qrytmp.FieldByName('rkey').asinteger);
          SetLength(LNodeArr,Length(LNodeArr)+1);
          LNodeArr[High(lnodeArr)] := LNode;

          dm1.qrytmp.Next;
        end;
        tv1.FullExpand;

        tv1Change(tv1,tv1.Items[0]);
      end;
    end;
    1:
    begin
      adsBMList.CommandText := 'SELECT RKey AS Rkey34, DEPT_CODE,null as step_no, DEPT_NAME, CASE TTYPE WHEN 1 THEN ''工序'' WHEN 4 THEN ''部门'' WHEN 5 THEN ''班组'' END AS steptype FROM Data0034 ORDER BY TTYPE';
    end;
  end;
  adsBMList.Open;
  ehBMlistTitleClick(ehBMlist.Columns[0]);
end;

procedure TfrmBMList.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmBMList.ehBMlistDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmBMList.ehBMlistTitleClick(Column: TColumnEh);
begin
  FHotColumn := Column;
  edtFilter.EditLabel.Caption := FHotColumn.Title.Caption;
end;

procedure TfrmBMList.edtFilterChange(Sender: TObject);
var
  tmpstr,sFilter:string;
  DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(ehBMlist.DataSource.DataSet);
  if not DATASET.Active then Exit;
  tmpstr:= trim(edtFilter.Text);
  if TmpStr='' then
  begin
    DATASET.Filtered:= False;
  end else
  begin
    if (FHotColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      DATASET.Filter := FHotColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      try
        StrToFloat(tmpstr);
      except
        DATASET.Filtered := False;
        Exit;
      end;
      sFilter := FHotColumn.Field.FieldName+'>='+TmpStr;
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      try
        tmpstr := FormatDateTime('YYYY-MM-DD hh:mm:ss',StrToDateTime(TmpStr));
      except
        Exit;
      end;
      sFilter := '>='+QuotedStr(TmpStr);
      DATASET.Filter := FHotColumn.Field.FieldName + sFilter;
      DATASET.Filtered:= true;
    end;
  end;
end;

procedure TfrmBMList.edtFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not adsBMList.IsEmpty) then
  begin
    ModalResult := mrOk;
    Exit;
  end;
  if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TLabeledEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TLabeledEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TLabeledEdit).text)>0 then
      if (key='-') then abort;
  end else
  if  FHotColumn.Field.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TLabeledEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TLabeledEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TLabeledEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TLabeledEdit).text)>0 then
      if (key='-') then abort;
  end ;
end;

procedure TfrmBMList.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmBMList.tv1Change(Sender: TObject; Node: TTreeNode);
begin
  if rg1.ItemIndex <> 0 then Exit; 
  adsBMList.Close;
  if Integer(Node.Data) = StrToInt(FRkey25) then
  begin
        adsBMList.CommandText:= ' select case d48.wtype when 0 then ''正常'' when 2 then ''返工'' when 3 then ''外发'' end as steptype, ' +
' d48.step_no,d34.dept_code,d34.dept_name,d34.rkey as rkey34 ' +
' from data0048 d48 ' +
' inner join data0034 d34 on d34.rkey = d48.fm_dept_ptr ' +
' where d48.wo_ptr = ' + FRkey06 +
' group by d48.step_no,d34.dept_code,d34.dept_name, d48.wtype,d34.rkey ' +
' union all ' +
' select ''当前工序'' as steptype,d56.step as step_no,d34.dept_code,d34.dept_name,d34.rkey as rkey34 ' +
' from data0056 d56 ' +
' inner join data0034 d34 on d56.dept_ptr = d34.rkey ' +
' where d56.wo_ptr = ' + FRkey06 +
' order by step_no asc ';
  end else
  begin
      adsBMList.CommandText:=
             ' select ''当前工序'' as steptype,d38.STEP_NUMBER as step_no,d34.dept_code,d34.dept_name,d34.rkey as rkey34 ' +
             ' FROM Data0025 d25 ' +
             ' INNER JOIN Data0038 d38 ON d38.SOURCE_PTR = d25.RKEY ' +
             ' INNER JOIN Data0034 d34 ON d34.RKEY = d38.DEPT_PTR ' +
             ' WHERE d25.RKEY = ' + IntToStr(Integer(Node.Data)) +
             ' order by step_no asc ';
  end;
  adsBMList.open;
end;

end.
