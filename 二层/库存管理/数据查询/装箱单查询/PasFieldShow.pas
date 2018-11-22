unit PasFieldShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,common, Grids, DBGridEh, DB, ADODB;

type
  TfrmFieldShow = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    dbField: TDBGridEh;
    Label1: TLabel;
    adoField: TADOQuery;
    DataSource3: TDataSource;
    adoFieldRkey: TAutoIncField;
    adoFieldD419_ptr: TIntegerField;
    adoFieldD073_ptr: TIntegerField;
    adoFieldFieldName: TStringField;
    adoFieldFieldCaption: TStringField;
    adoFieldFieldOrder: TIntegerField;
    adoFieldFieldWidth: TIntegerField;
    adoFieldIsDisplay: TBooleanField;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dbFieldKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure adoFieldAfterInsert(DataSet: TDataSet);
    procedure adoFieldAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    key419:Integer;
    { Public declarations }
  end;

var
  frmFieldShow: TfrmFieldShow;

implementation

uses main;


{$R *.dfm}

procedure TfrmFieldShow.FormShow(Sender: TObject);
begin
  with adoField do
  begin
    Close;
    Parameters.ParamByName('key419').Value:=key419;
    Parameters.ParamByName('rkey73').Value:=rkey73;
    Open;
    sort:='fieldorder';

  end;
end;

procedure TfrmFieldShow.btnSaveClick(Sender: TObject);
begin
  adoField.UpdateBatch();
  ModalResult:=mrYes;
end;

procedure TfrmFieldShow.dbFieldKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_delete) and (ssCtrl in Shift) then abort;
end;

procedure TfrmFieldShow.adoFieldAfterInsert(DataSet: TDataSet);
begin
  abort;
end;

procedure TfrmFieldShow.adoFieldAfterDelete(DataSet: TDataSet);
begin
  abort;
end;

end.
