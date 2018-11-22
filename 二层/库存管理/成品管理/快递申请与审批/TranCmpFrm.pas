unit TranCmpFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, Grids, DBGridEh, DM, Mask, DBCtrls,
  StdCtrls;

type
  TfrmTranBaseInfo = class(TForm)
    pnl2: TPanel;
    pnl3: TPanel;
    eh1: TDBGridEh;
    ads818: TADODataSet;
    ds818: TDataSource;
    ads818TranCode: TStringField;
    ads818TranName: TStringField;
    ads818TranEasyName: TStringField;
    btn1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btn2: TButton;
    lbl4: TLabel;
    ads818RegCode: TStringField;
    edttrancode: TEdit;
    edttraneasyname: TEdit;
    edtRegCode: TEdit;
    mmoFullName: TMemo;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ads818AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation


{$R *.dfm}

procedure TfrmTranBaseInfo.btn2Click(Sender: TObject);
begin
  ads818.Edit;
  ads818.fieldbyname('trancode').AsString := edttrancode.Text;
  ads818.fieldbyname('traneasyname').AsString := edttraneasyname.Text;
  ads818.fieldbyname('regcode').AsString := edtRegCode.Text;
  ads818.fieldbyname('tranname').AsString := mmoFullName.Text;
  ads818.Post;
end;

procedure TfrmTranBaseInfo.btn1Click(Sender: TObject);
begin
  ads818.Append;
end;

procedure TfrmTranBaseInfo.FormShow(Sender: TObject);
begin
  ads818.Open;
end;

procedure TfrmTranBaseInfo.ads818AfterScroll(DataSet: TDataSet);
begin
  edttrancode.Text := ads818.fieldbyname('trancode').AsString;
  edttraneasyname.Text := ads818.fieldbyname('traneasyname').AsString;
  edtRegCode.Text := ads818.fieldbyname('regcode').AsString;
  mmoFullName.Text := ads818.fieldbyname('tranname').AsString;
end;

end.
