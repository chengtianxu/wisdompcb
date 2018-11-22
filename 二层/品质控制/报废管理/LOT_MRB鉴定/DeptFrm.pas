unit DeptFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, DB, ADODB, DM;

type
  TfrmDeptList = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btnOK: TButton;
    eh1: TDBGridEh;
    lbl1: TLabel;
    edt1: TEdit;
    rg1: TRadioGroup;
    qry1: TADOQuery;
    ds1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure eh1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetData(ARkey06: string);
  public
    { Public declarations }
  end;

var
  frmDeptList: TfrmDeptList;

implementation

{$R *.dfm}

{ TfrmDeptList }

procedure TfrmDeptList.GetData(ARkey06: string);
var
  LS: TStringList;
  tmpS: string;
begin
  Self.qry1.Close;
  LS := TStringList.Create;
  try
    case rg1.ItemIndex of
      0:begin
        if ARkey06 = '' then
        begin
          tmpS := 'SELECT RKey AS RKey34, DEPT_CODE, DEPT_NAME ,0 AS STEP_NO FROM Data0034 WHERE 1 = 2';
        end
        else
        begin
        tmpS := 'select distinct data0048.step_no,data0034.rkey as RKey34,data0034.dept_code,'+
            'data0034.dept_name '+
            'from data0048 INNER JOIN data0034 '+
            'on data0048.fm_dept_ptr=data0034.rkey '+
            'INNER JOIN Data0056 D56 ON D56.WO_PTR = Data0048.WO_PTR ' +
            'where data0048.wo_ptr=' + ARkey06 +
            ' AND Data0048.STEP_NO <= D56.STEP ' +
            ' union '+
            'select data0056.step as step_no,data0034.rkey as RKey34,data0034.dept_code,'+
            'data0034.dept_name '+
            'from data0056 INNER JOIN data0034 '+
            'on data0056.dept_ptr = data0034.rkey '+
            'where data0056.wo_ptr='+ ARkey06 +
            ' order by step_no';
        end;
        LS.Add(tmpS);
        eh1.Columns[0].Title.Caption := '工序代码';
        eh1.Columns[0].FieldName := 'DEPT_CODE';
        eh1.Columns[1].Title.Caption := '工序名称';
        eh1.Columns[1].FieldName := 'DEPT_NAME';
        eh1.Columns[2].Title.Caption := '步骤号';
        eh1.Columns[2].FieldName := 'STEP_NO';
        
      end;
      1:begin
        tmpS := 'SELECT RKey AS RKey34, DEPT_CODE, DEPT_NAME, CASE TTYPE WHEN 1 THEN ''工序'' WHEN 4 THEN ''部门'' WHEN 5 THEN ''班组'' END AS DEPTTYPE FROM Data0034 ORDER BY TTYPE';
        LS.Add(tmpS);
        eh1.Columns[0].Title.Caption := '部门代码';
        eh1.Columns[0].FieldName := 'DEPT_CODE';
        eh1.Columns[1].Title.Caption := '部门名称';
        eh1.Columns[1].FieldName := 'DEPT_NAME';
        eh1.Columns[2].Title.Caption := '类别';
        eh1.Columns[2].FieldName := 'DEPTTYPE';

      end;
    end;
    DM1.SqlOpen(LS,Self.qry1);
  finally
    LS.Free;
  end;
end;

procedure TfrmDeptList.FormShow(Sender: TObject);
begin
  GetData(DM1.adsFrmMain.fieldbyname('RKey').AsString);
end;

procedure TfrmDeptList.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDeptList.rg1Click(Sender: TObject);
begin
  FormShow(Self);
end;

procedure TfrmDeptList.eh1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
