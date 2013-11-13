--��ͷ

--MisDescBegin
x207015_g_ScriptId = 207015
x207016_g_ScriptId = 207016
x207014_g_ScriptId = 207014
x207014_g_MissionIdPre =14
x207014_g_MissionId = 15
x207014_g_MissionKind = 1
x207014_g_ScriptIdNext = {ScriptId = 207017 ,LV = 1 }
x207014_g_Name	="����" 
x207014_g_Name2	="���˺�" 

x207014_g_MissionName="��ͷ"
x207014_g_MissionInfo="    �����ӳ��������������þ�����һ���ᱨ������𡣺ٺ٣�����û�뵽�������������ʱ���Ѿ�������һ��׼����\n \n    �����������Ұ��������֮ǰ���Ѿ���ױ�����ˡ����ҵ��ǣ����������������ߵ��ˣ������ڵĲ���֮����ֻ����һ����֪������\n \n    #GҰ����#W��33,84������#G���˺�#W�����ҵ����ߣ�����������µ���Ϣ����ͷ�����ǣ������ǵػ�������������� "  --��������
x207014_g_MissionTarget="    ��#G���˺�#W��ͷ"		
x207014_g_MissionComplete="    �ޣ��������ӣ�������ȥ���#G������#W������û�뵽�����������ˣ��ţ�������Ŀ�����Ѿ�֪���ˣ�������������˴����⡭�����ң��ң��Һܵ��ģ�\n \n    ������ܾ����������飬���룬�����Ҫȥ��������~���ҿɲ�����ô������������žͿ����ˣ�������Σ���һ��Ҫ������취�����Ҳ��뻹û�����ҵĺ��Ӿ͡���"					--�������npc˵���Ļ�
x207014_g_answer1="֥�鿪��"
x207014_g_answer2="�ػ�������"
x207014_g_answer3="���������"
--������
x207014_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207014_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207014_g_RadioItemBonus={}

--MisDescEnd


--**********************************

--������ں���

--**********************************

function x207014_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207014_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207014_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207014_g_Name2) then
                     	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207014_g_MissionName)
			AddText(sceneId,x207014_g_MissionComplete)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207014_g_MissionTarget) 
			AddMoneyBonus(sceneId, x207014_g_MoneyBonus)	
			EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x207014_g_ScriptId, x207014_g_MissionId)
		end
        elseif x207014_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207014_g_MissionName)
                AddText(sceneId,x207014_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207014_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207014_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207014_g_ScriptId, x207014_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207014_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207014_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207014_CheckPushList(sceneId, selfId, targetId) > 0 then
		if (GetName(sceneId,targetId)==x207014_g_Name) then
			AddNumText(sceneId, x207014_g_ScriptId, x207014_g_MissionName)
		end
		if (GetName(sceneId,targetId)==x207014_g_Name2) then
			AddNumText(sceneId, x207015_g_ScriptId, x207014_g_answer1)
			AddNumText(sceneId, x207015_g_ScriptId, x207014_g_answer2)
			AddNumText(sceneId, x207016_g_ScriptId, x207014_g_answer3)
		end
	end
	
end



--**********************************

--����������

--**********************************

function x207014_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207014_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207014_CheckPushList(sceneId, selfId, targetId)
	if IsMissionHaveDone(sceneId, selfId, x207014_g_MissionIdPre) > 0 then
        	if (GetName(sceneId,targetId)==x207014_g_Name) then
                	if IsHaveMission(sceneId,selfId, x207014_g_MissionId)<= 0 then
                   	 return 1
                	end
        	end
		if (GetName(sceneId,targetId)==x207014_g_Name2) then
		    	if IsHaveMission(sceneId,selfId, x207014_g_MissionId) > 0 then
		    	return 1
                    	end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207014_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207014_g_MissionId, x207014_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x207014_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x207014_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207014_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207014_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207014_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207014_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207014_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207014_g_MissionId)
		AddExp(sceneId, selfId, x207014_g_ExpBonus)
		AddMoney(sceneId, selfId, x207014_g_MoneyBonus)
		
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207014_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207014_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207014_OnItemChanged(sceneId, selfId, itemdataId)

end

